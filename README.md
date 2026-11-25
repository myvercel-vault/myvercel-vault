# MyVercel Vault — Polyglot Project

[![Netlify Status](https://api.netlify.com/api/v1/badges/8579aa9a-ded1-4f70-85ca-9e0d51a21d47/deploy-status)](https://app.netlify.com/projects/myvercel-vault/deploys)
Vue + TypeScript + Ruby + Python + WebAssembly

Frontend: Vue 3 + TS + Vite (no full HTML page, only SFC)
Backend API: Ruby Sinatra + Neon DB (Postgres)
Service: Python FastAPI (password generator, TOTP, R2 presigned)
Crypto fast path: WebAssembly (Rust -> wasm) for password strength + TOTP

## Structure
frontend/  -> Vue + TS
backend-ruby/ -> Ruby API, Neon
python-service/ -> Python FastAPI
wasm/ -> Rust -> WASM

## Run
1) Frontend: cd frontend && npm install && npm run dev
2) Ruby: cd backend-ruby && bundle install && ruby app.rb -p 4567
3) Python: cd python-service && pip install -r requirements.txt && uvicorn app:app --port 8001
4) WASM: cd wasm && ./build.sh  (needs rust + wasm-pack)

Flow: Landing -> [Get Started] -> Login Page -> My Vault
Login Page: Email+Password, Google, GitHub, Forgot password? (link only bottom), [Create an Account] single button, "Use another sign-in method" -> Username login separate page.
Vault hidden until signed in. No Create Vault outside.
