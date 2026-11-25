let cache:any=null
// Loads Rust-compiled WASM: wasm/crypto.wasm built by wasm-pack
// Exposes: strength(password) -> Bad|Medium|Strong, totp(secret, counter) -> 6-digit
export async function loadWasm(){ if(cache) return cache; const res=await fetch(import.meta.env.VITE_WASM_URL||'/wasm/crypto.wasm'); const buf=await res.arrayBuffer(); const mod=await WebAssembly.instantiate(buf,{env:{}}); cache=mod.instance.exports; return cache }
