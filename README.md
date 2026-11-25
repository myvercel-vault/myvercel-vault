# MyVercel Vault — Polyglot Project
<p align="center">
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

# 🔐 MyVercel Vault — Nexvault Vault Peribadi Selamat

> Password manager peribadi yang selamat, laju dan premium. Tema hitam premium + putih ala Vercel, dengan animasi live, mascot 3D, dan vault yang di-encrypt sepenuhnya.

[Status](https://img.shields.io/badge/Status-Active-success)
[Frontend](https://img.shields.io/badge/Frontend-Vue%20%2B%20TypeScript-42b883)
[Backend](https://img.shields.io/badge/Backend-Ruby%20%2B%20Python-orange)
[Database](https://img.shields.io/badge/Database-Neon%20PostgreSQL-00e699)
[Storage](https://img.shields.io/badge/Storage-Cloudflare%20R2-f48120)
[Deploy](https://img.shields.io/badge/Deploy-Netlify-00c7b7)

---

## 📑 Isi Kandungan

- [Apa Itu MyVercel Vault?](#-apa-itu-myvercel-vault)
- [Ciri Utama](#-ciri-utama)
- [Tech Stack](#-tech-stack)
- [Struktur Project](#-struktur-project)
- [Jenis Vault Item](#-jenis-vault-item)
- [Jadual Setup & Deployment](#-jadual-setup--deployment)
- [Environment Variables](#-environment-variables)
- [Cara Install & Run](#-cara-install--run)
- [Cara Deploy ke Netlify](#-cara-deploy-ke-netlify)
- [Cara Deploy Backend](#-cara-deploy-backend)
- [Keselamatan](#-keselamatan)
- [Jadual Roadmap](#-jadual-roadmap)
- [Troubleshooting](#-troubleshooting)

---

## ✨ Apa Itu MyVercel Vault?

**MyVercel Vault** (juga dipanggil **Nexvault**) adalah password manager peribadi untuk simpan:

- Login & password
- Kad bank
- Identity / IC / Passport
- Nota rahsia
- API Key & credential
- WiFi, Crypto Wallet, SSH Key, Server, Software License, Database

Semua data di-encrypt dengan **AES-GCM 256-bit + PBKDF2 210,000 iterations** sebelum disimpan. Server hanya simpan data yang dah di-encrypt. Password master tidak pernah dihantar ke server dalam bentuk plaintext.

> **Prinsip:** Vault tersembunyi sebelum login. Tiada fake Google / GitHub / Alias connection. Kalau belum setup, tunjuk `Setup Required`.

---

## 🚀 Ciri Utama

| # | Ciri | Status | Nota |
|---|------|--------|------|
| 1 | **Login Email + Password** | ✅ Siap | Hanya Email + Password di Login page |
| 2 | **Google / GitHub Login** | ✅ UI Siap | Button ada, tunjuk Setup Required kalau belum setup OAuth |
| 3 | **Forgot Password** | ✅ Siap | Link di bawah button Google |
| 4 | **Create Account** | ✅ Siap | Satu button `[Create an Account]` sahaja |
| 5 | **Username Login** | ✅ Siap | Dipindah ke `Other sign-in methods` |
| 6 | **Get Started → Login** | ✅ Siap | Get Started bawa ke Login, bukan terus ke Vault |
| 7 | **Vault Tersembunyi Sebelum Login** | ✅ Siap | Tiada Create Vault sebelum sign-in |
| 8 | **7-Saat Loading Spinner** | ✅ Siap | Spinner + Welcome Popup |
| 9 | **Navbar Fixed + Hamburger** | ✅ Siap | Responsive mobile + desktop |
| 10 | **Hero + Banner + Footer** | ✅ Siap | Tema hitam premium + putih Vercel |
| 11 | **FAQ Accordion** | ✅ Siap | Boleh buka / tutup |
| 12 | **Primary Button Shine 2 Saat** | ✅ Siap | Cahaya lalu setiap 2s |
| 13 | **Live Animations + Touch Effects** | ✅ Siap | Hover, tap, ripple |
| 14 | **Mascot 3D Haiwan Live** | ✅ Siap | 50+ ayat custom, bercakap & react |
| 15 | **15+ Pages** | ✅ Siap | Home, Login, Register, Vault, Settings, dll |
| 16 | **Custom Fields / Sections** | ✅ Siap | Tambah field sendiri |
| 17 | **OTP Box Max 32 Boxes** | ✅ Siap | Untuk TOTP / kod |
| 18 | **Color Select + Icon Upload** | ✅ Siap | Setiap item boleh ada warna & ikon |
| 19 | **Field [Create] Buttons** | ✅ Siap | Setiap field ada button Create sendiri |
| 20 | **3-Dot Menu Per Field** | ✅ Siap | Edit / Duplicate / Delete per field |
| 21 | **Password Generator** | ✅ Siap | Panjang, simbol, angka boleh adjust |
| 22 | **Upload Gambar / Video Attachment** | ✅ Siap | Simpan di Cloudflare R2 |
| 23 | **Search + Filter Vault** | ✅ Siap | Cari ikut nama, kategori, tag |
| 24 | **Secret Hidden By Default** | ✅ Siap | Kena verify baru boleh reveal |

---

## 🛠 Tech Stack

| Layer | Teknologi | Kegunaan |
|-------|-----------|----------|
| **Frontend** | Vue 3 + TypeScript + Vite 5 | UI utama, SPA, routing |
| **Styling** | CSS Custom + Tailwind-style | Tema hitam premium + putih Vercel |
| **Crypto (JS)** | WebCrypto API `crypto.subtle` | AES-GCM, PBKDF2 |
| **Crypto (WASM)** | WebAssembly (Rust / C → WASM) | Password strength, hashing laju |
| **Backend Utama** | Ruby (Sinatra / Rails API) | Auth, Vault CRUD, R2 presigned URL |
| **Backend Kedua** | Python (FastAPI) | File upload, thumbnail, OCR / validation |
| **Database** | Neon PostgreSQL | Simpan user, vault items (encrypted) |
| **Storage** | Cloudflare R2 — Bucket `vault-storage` | Gambar, video, attachment |
| **Frontend Hosting** | Netlify | Deploy `frontend/dist` |
| **Backend Hosting** | Railway / Render (akan datang) | Deploy Ruby + Python |
| **Auth** | JWT + Bcrypt | Token, hash password |
| **Package Manager** | npm | Frontend dependencies |

---

## 📁 Struktur Project

| Path | Fungsi |
|------|--------|
| `netlify.toml` | Config Netlify — base, build, publish, redirect SPA |
| `.env` | Env sebenar — di root, **JANGAN commit** |
| `.env.example` | Contoh env sahaja, selamat untuk commit |
| `frontend/` | App Vue + TypeScript |
| `frontend/package.json` | Script frontend — `build` mesti `vite build` sahaja |
| `frontend/src/` | Source code frontend |
| `frontend/src/lib/crypto.ts` | Encrypt / decrypt AES-GCM + PBKDF2 |
| `frontend/src/lib/wasm-loader.ts` | Load fail WASM crypto |
| `frontend/src/vite-env.d.ts` | Declare `import.meta.env` untuk TypeScript |
| `frontend/src/App.vue` | Root component |
| `frontend/src/router/` | Routing SPA |
| `frontend/dist/` | Output build Netlify publish |
| `backend-ruby/` | API Ruby — Auth, Vault, R2 |
| `python-service/` | API Python FastAPI — Upload, processing |
| `wasm/` | Source WASM + `crypto.wasm` |
| `README.md` | Fail ini |

---

## 🗂 Jenis Vault Item

| Kategori | Contoh Field | Icon |
|----------|--------------|------|
| **Login** | Username, Password, URL, TOTP | 🔑 |
| **Password** | Password sahaja + nota | 🔒 |
| **Card** | Nombor kad, Expiry, CVV, Nama | 💳 |
| **Identity** | Nama penuh, IC, Passport, DOB | 🪪 |
| **Note** | Tajuk + isi nota panjang | 📝 |
| **Alias Email** | Alias, Forward to, Service | 📧 |
| **API Credential** | API Key, Secret, Endpoint | 🔌 |
| **Bank Account** | Bank, No akaun, SWIFT | 🏦 |
| **Other** | Custom bebas | 📦 |
| **Database** | Host, Port, User, Password | 🗄️ |
| **SSH Key** | Public / Private Key | 🔐 |
| **Server** | IP, SSH Port, Root password | 🖥️ |
| **Software License** | License Key, Expiry | 💻 |
| **WiFi** | SSID, Password, Security | 📶 |
| **Crypto Wallet** | Seed Phrase, Address, Network | ₿ |
| **Start from Scratch** | Kosong, tambah field sendiri | ✨ |

Setiap item boleh tambah:

| Ciri Per Item | Detail |
|---------------|--------|
| Custom Fields | Text, Password, URL, Date, Number, TOTP |
| Custom Sections | Group field ikut kategori sendiri |
| OTP Box | Max 32 boxes |
| Color | Pilih warna item |
| Icon | Upload ikon sendiri |
| Attachment | Gambar / Video → R2 |
| 3-Dot Menu | Edit / Copy / Duplicate / Delete |

---

## 🗓 Jadual Setup & Deployment

### Jadual 1 — Setup Awal (Dah Siap)

| Bil | Task | Status | Catatan |
|-----|------|--------|---------|
| 1 | Buat repo GitHub `myvercel-vault` | ✅ Siap | Branch `main` |
| 2 | Buat `frontend` Vue + TS | ✅ Siap | Vite 5.4.21 |
| 3 | Buat `netlify.toml` di root | ✅ Siap | `base = frontend`, `command = vite build` |
| 4 | Padam `package-lock.json` rosak | ✅ Siap | Buat baru dengan `npm install` |
| 5 | Buat Neon DB `myvercel-db` | ✅ Siap | PostgreSQL |
| 6 | Buat R2 Bucket `vault-storage` | ✅ Siap | Object Read & Write, specific bucket |
| 7 | Buat R2 Account API Token | ✅ Siap | Jangan dedah Secret Key |
| 8 | Ambil `R2_PUBLIC_URL` | ⏳ Perlu semak | Dari Public Development URL / R2.dev subdomain |
| 9 | Buat `.env` di root | ✅ Siap | Nama mesti tepat `.env` |

### Jadual 2 — Deployment Frontend (Netlify)

| Bil | Step | Status |
|-----|------|--------|
| 1 | Push ke GitHub `main` | ✅ |
| 2 | Netlify → Add new site → Import from GitHub | ✅ |
| 3 | Pilih repo `myvercel-vault` | ✅ |
| 4 | Base directory: `frontend` | ✅ |
| 5 | Build command: `vite build` | ⚠️ Mesti `vite build` sahaja, bukan `vue-tsc && vite build` |
| 6 | Publish directory: `dist` | ✅ |
| 7 | Deploy → Tunggu `Published` | ❌ Gagal sebelum ni sebab `vue-tsc` error |
| 8 | Buka link `https://xxx.netlify.app` | ⏳ Selepas fix |
| 9 | Test route `/login` tak 404 | ⏳ Selepas fix |

### Jadual 3 — Deployment Backend (Akan Datang)

| Bil | Task | Platform | Status |
|-----|------|----------|--------|
| 1 | Deploy Ruby API | Railway / Render | ⏳ Belum |
| 2 | Deploy Python FastAPI | Railway / Render | ⏳ Belum |
| 3 | Set `VITE_API_URL` ke URL live Ruby | Netlify Env | ⏳ Belum |
| 4 | Set `VITE_PYTHON_URL` ke URL live Python | Netlify Env | ⏳ Belum |
| 5 | Test Create Account → Save Login Item | Live | ⏳ Belum |
| 6 | Test Upload Gambar → Check R2 Bucket | Live | ⏳ Belum |
| 7 | Rename Netlify site ke URL bersih | Netlify | ⏳ Belum |

---

## 🔑 Environment Variables

### Fail `.env` (di Root — Jangan Commit!)

| Variable | Contoh | Kegunaan |
|----------|--------|----------|
| `DATABASE_URL` | `postgres://user:pass@ep-xxx.neon.tech/myvercel-db?sslmode=require` | Sambung ke Neon DB |
| `JWT_SECRET` | `random-string-panjang-64-char` | Sign JWT token |
| `R2_ACCOUNT_ID` | `abc123...` | ID akaun Cloudflare |
| `R2_ACCESS_KEY_ID` | `xxxx` | R2 Access Key |
| `R2_SECRET_ACCESS_KEY` | `xxxx` | R2 Secret Key — **RAHSIA** |
| `R2_BUCKET` | `vault-storage` | Nama bucket, mesti tepat |
| `R2_PUBLIC_URL` | `https://pub-xxx.r2.dev` | Public Development URL untuk papar gambar |
| `VITE_API_URL` | `http://localhost:3000` / live URL | URL backend Ruby |
| `VITE_PYTHON_URL` | `http://localhost:8000` / live URL | URL backend Python |

### Fail `.env.example` (Selamat Commit)

```env
DATABASE_URL=postgres://user:password@host/myvercel-db?sslmode=require
JWT_SECRET=change-me-to-long-random-string
R2_ACCOUNT_ID=your-account-id
R2_ACCESS_KEY_ID=your-access-key
R2_SECRET_ACCESS_KEY=your-secret-key
R2_BUCKET=vault-storage
R2_PUBLIC_URL=https://pub-xxx.r2.dev
VITE_API_URL=http://localhost:3000
VITE_PYTHON_URL=http://localhost:8000
```

> ⚠️ **Jangan paste secret sebenar dalam chat / README / GitHub.** Kalau dah terdedah, terus rotate: Neon password, R2 token, `JWT_SECRET`.

---

## 💻 Cara Install & Run

### 1. Clone Repo

```bash
git clone https://github.com/myvercel-vault/myvercel-vault.git
cd myvercel-vault
```

### 2. Frontend

```bash
cd frontend
npm install
npm run dev
# Buka http://localhost:5173
```

### 3. Backend Ruby

```bash
cd backend-ruby
bundle install
ruby app.rb
# atau: bundle exec rackup -p 3000
```

### 4. Backend Python

```bash
cd python-service
pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```

---

## ☁️ Cara Deploy ke Netlify

| Step | Apa Nak Buat |
|------|--------------|
| 1 | Pastikan `netlify.toml` ada di root, bukan dalam `frontend/` |
| 2 | Pastikan `frontend/package.json` → `"build": "vite build"` |
| 3 | Push ke GitHub `main` |
| 4 | Netlify → `Add new site` → `Import an existing project` → Pilih GitHub |
| 5 | Pilih repo `myvercel-vault` |
| 6 | Setting: Base `frontend`, Build `vite build`, Publish `dist` |
| 7 | Tekan `Deploy site` |
| 8 | Kalau fail, tekan `Trigger deploy` → `Clear cache and deploy site` |

### Isi `netlify.toml` Yang Betul

```toml
[build]
  base = "frontend"
  command = "vite build"
  publish = "dist"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

> **Penting:** `command` mesti `vite build` sahaja. Kalau masih `vue-tsc && vite build`, build akan fail dengan error `TS2769` (crypto.ts) dan `TS2339` (wasm-loader.ts).

---

## 🔐 Keselamatan

| Aspek | Cara Dilakukan |
|-------|---------------|
| Encryption | AES-GCM 256-bit, PBKDF2 210k iterations |
| Password Storage | Bcrypt hash, tidak simpan plaintext |
| Secret Fields | Hidden by default, reveal lepas verify |
| JWT | Expire token, simpan di httpOnly / memory |
| R2 Upload | Presigned URL, token specific bucket sahaja |
| Env | `.env` di `.gitignore`, tidak commit |
| Logs | Jangan log secret, password, token |
| CORS | Hanya benarkan domain Netlify + localhost |

---

## 🗓 Jadual Roadmap

| Fasa | Tarikh Sasaran | Task |
|------|----------------|------|
| **Fasa 1 — Frontend** | ✅ Siap | UI, 15+ pages, mascot, animasi |
| **Fasa 2 — Fix Netlify** | 🔥 Sekarang | Tukar build ke `vite build`, deploy `Published` |
| **Fasa 3 — Backend** | Minggu ini | Deploy Ruby + Python ke Railway / Render |
| **Fasa 4 — Neon + R2 End-to-End** | Minggu ini | Create account, Save `Test Gambar`, upload gambar/video, check R2 bucket |
| **Fasa 5 — Rotate Secrets** | Segera | Rotate Neon password, R2 token, JWT_SECRET yang pernah terdedah |
| **Fasa 6 — Polish** | Seterusnya | Rename Netlify site, test SPA routes, test mobile iPhone |

---

## 🧯 Troubleshooting

| Masalah | Punca | Penyelesaian |
|---------|-------|--------------|
| `vue-tsc && vite build` fail `TS2769` | Type `Uint8Array` tak match `BufferSource` | Tukar build ke `vite build` sahaja, atau tambah `as unknown as BufferSource` dalam `crypto.ts` |
| `TS2339 Property 'env' does not exist on ImportMeta` | Tiada `vite/client` types | Buat fail `frontend/src/vite-env.d.ts` dengan `/// <reference types="vite/client" />` |
| `Page Not Found` bila buka `/login` | SPA redirect tiada | Pastikan `netlify.toml` ada `[[redirects]]` ke `/index.html` |
| `package-lock.json` ada isi Netlify | Tersalah paste | Padam fail tu, `npm install` balik untuk buat baru |
| `netlify.toml` dalam `frontend/` | Salah tempat | `netlify.toml` mesti di root, bukan dalam `frontend/` |
| Gambar tak keluar lepas upload | `R2_PUBLIC_URL` salah / belum Enable | Guna Public Development URL dari Cloudflare R2 → Settings → Public Access |
| Build lama je keluar (jam 3:08 AM) | Belum trigger deploy baru | Tekan `Trigger deploy` → `Clear cache and deploy site` |
| `npm install` fail dalam Codespace | `package-lock.json` rosak / conflict | `git pull`, padam lock, `npm install`, `git push` |

---

## 📝 Nota Developer

- Guna iPhone + GitHub Codespace — tiada `Ctrl+C`. Guna butang `Stop` / `Trash` dalam Codespace untuk stop terminal.
- Jangan edit fail dalam 2 tempat serentak (GitHub web + Codespace) — nanti conflict. Buat di satu tempat, `git pull` di tempat lain.
- Semua button / popup / generator / save mesti ada function sebenar, bukan hiasan.
- Bahasa UI: English untuk label / button / error / placeholder. README ini dalam Melayu untuk senang faham.

---

## 📄 License

MIT — Bebas guna untuk project peribadi.

**Dibina dengan ❤️ — MyVercel Vault / Nexvault**
