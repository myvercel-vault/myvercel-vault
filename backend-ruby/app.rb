# MyVercel Vault — Ruby API (Sinatra) + Neon DB
# Vault records are stored as encrypted_data (AES-GCM). Server never decrypts, never logs secrets.
require 'sinatra/base'
require 'pg'
require 'bcrypt'
require 'jwt'
require 'json'
require 'rack/cors'

module MyVercelVault
  class App < Sinatra::Base
    use Rack::Cors do
      allow do origins 'http://localhost:5173'; resource '*', headers: :any, methods: [:get,:post,:put,:delete,:options] end
    end
    configure { set :port, 4567 }

    def db
      @db ||= PG.connect(ENV['DATABASE_URL'] || raise('Setup Required: DATABASE_URL missing — set Neon DATABASE_URL'))
    end
    def jwt_secret; ENV['JWT_SECRET'] || 'dev-only-change-me'; end
    def auth_user
      token = request.env['HTTP_AUTHORIZATION']&.split(' ')&.last
      halt 401, {error:'Unauthorized'}.to_json unless token
      payload = JWT.decode(token, jwt_secret, true, algorithm:'HS256')[0]
      payload['user_id']
    rescue JWT::DecodeError
      halt 401, {error:'Invalid token'}.to_json
    end

    post '/api/auth/register' do
      d = JSON.parse(request.body.read)
      halt 400, {error:'Passwords do not match'}.to_json if d['password'] != d['confirm']
      pw = BCrypt::Password.create(d['password']); pin = BCrypt::Password.create(d['pin'])
      id = db.exec_params("INSERT INTO users(name,username,email,password_hash,vault_pin_hash) VALUES($1,$2,$3,$4,$5) RETURNING id", [d['name'],d['username'],d['email'],pw,pin])[0]['id']
      {id:id}.to_json
    end

    post '/api/auth/login' do
      d = JSON.parse(request.body.read)
      u = db.exec_params("SELECT * FROM users WHERE email=$1", [d['email']]).first
      halt 401, {error:'Invalid email or password'}.to_json unless u && BCrypt::Password.new(u['password_hash']) == d['password']
      token = JWT.encode({user_id:u['id'], exp:Time.now.to_i+86400}, jwt_secret, 'HS256')
      {token:token, user:{id:u['id'], name:u['name'], email:u['email']}}.to_json
    end

    post '/api/auth/login-username' do
      d = JSON.parse(request.body.read)
      u = db.exec_params("SELECT * FROM users WHERE username=$1", [d['username']]).first
      halt 401, {error:'Invalid username or password'}.to_json unless u && BCrypt::Password.new(u['password_hash']) == d['password']
      token = JWT.encode({user_id:u['id'], exp:Time.now.to_i+86400}, jwt_secret, 'HS256')
      {token:token, user:{id:u['id'], name:u['name'], email:u['email']}}.to_json
    end

    # Vault: encrypted_data only. Live search in frontend must NOT search secrets — Ruby only returns title/type/website/email (non-secret) for list, encrypted blob for detail.
    get '/api/vault' do
      uid = auth_user
      rows = db.exec_params("SELECT id,type,title,encrypted_data,iv,is_favorite,created_at FROM vault_items WHERE user_id=$1 ORDER BY updated_at DESC", [uid])
      rows.to_a.to_json
    end

    post '/api/vault' do
      uid = auth_user; d = JSON.parse(request.body.read)
      halt 400, {error:'encrypted_data required — encrypt in browser first'}.to_json unless d['encrypted_data']
      r = db.exec_params("INSERT INTO vault_items(user_id,type,title,encrypted_data,iv) VALUES($1,$2,$3,$4,$5) RETURNING id", [uid,d['type'],d['title'],d['encrypted_data'],d['iv']])
      {id:r[0]['id'], message:'Saved to your vault'}.to_json
    end

    delete '/api/vault/:id' do
      uid = auth_user
      db.exec_params("DELETE FROM vault_items WHERE id=$1 AND user_id=$2", [params[:id], uid])
      {ok:true}.to_json
    end

    get '/health' do {ok:true, db: ENV['DATABASE_URL'] ? 'configured' : 'Setup Required'}.to_json end
  end
end
