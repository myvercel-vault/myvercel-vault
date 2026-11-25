# MyVercel Vault — Polyglot Project
<p align="center">
  <img src="https://api.iconify.design/logos:docker.svg" alt="docker" width="24" height="24" />].    (https://api.iconify.design/logos:docker.svg)
  <img src="https://cdn.simpleicons.org/vuedotjs" width="40" alt="Vue" />
  <img src="https://cdn.simpleicons.org/linux" width="40" alt="Linux" />
  <img src="https://cdn.simpleicons.org/docker" width="40" alt="Docker" />
  <img src="https://cdn.simpleicons.org/netlify" width="40" alt="Netlify" />
  <img src="https://cdn.simpleicons.org/vercel" width="40" alt="Vercel" />
  <img src="https://cdn.simpleicons.org/github" width="40" alt="GitHub" />
  <img src="https://cdn.jsdelivr.net/gh/twitter/twemoji@14.0.2/assets/svg/1f40b.svg" width="40" alt="Whale" />
</p>

| Vue | Linux | Netlify |
| :---: | :---: | :---: |
| <img src="https://cdn.simpleicons.org/vuedotjs" width="40" /> | <img src="https://cdn.simpleicons.org/linux" width="40" /> | <img src="https://cdn.simpleicons.org/netlify" width="40" /> |
| Vercel | GitHub | Whale |
| <img src="https://cdn.simpleicons.org/vercel" width="40" /> | <img src="https://cdn.simpleicons.org/github" width="40" /> | <img src="https://cdn.jsdelivr.net/gh/twitter/twemoji@14.0.2/assets/svg/1f40b.svg" width="40" /> |

## Vue + TypeScript + Ruby + Python + WebAssembly

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
