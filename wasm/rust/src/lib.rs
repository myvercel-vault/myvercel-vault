// MyVercel Vault — WASM (Rust -> wasm-bindgen)
// Fast paths: password strength + TOTP. No network, no logging.
use wasm_bindgen::prelude::*;
use hmac::{Hmac, Mac};
use sha1::Sha1;
type HmacSha1 = Hmac<Sha1>;

#[wasm_bindgen]
pub fn strength(password: &str) -> String {
    let mut score = 0;
    if password.len() >= 12 { score += 2; } else if password.len() >= 8 { score += 1; }
    if password.chars().any(|c| c.is_uppercase()) { score += 1; }
    if password.chars().any(|c| c.is_lowercase()) { score += 1; }
    if password.chars().any(|c| c.is_numeric()) { score += 1; }
    if password.chars().any(|c| !c.is_alphanumeric()) { score += 1; }
    if score >= 5 { "Strong".to_string() } else if score >= 3 { "Medium".to_string() } else { "Bad".to_string() }
}

#[wasm_bindgen]
pub fn totp_code(secret_b32: &str, counter: u64) -> String {
    // Base32 decode (RFC 4648, no padding handling simplified)
    let alphabet = b"ABCDEFGHIJKLMNOPQRSTUVWXYZ234567";
    let mut bits: u32 = 0; let mut nbits = 0; let mut key: Vec<u8> = Vec::new();
    for ch in secret_b32.to_uppercase().chars() {
        if ch == '=' { break; }
        let v = alphabet.iter().position(|&c| c as char == ch).unwrap_or(0) as u32;
        bits = (bits << 5) | v; nbits += 5;
        if nbits >= 8 { key.push(((bits >> (nbits - 8)) & 0xFF) as u8); nbits -= 8; }
    }
    let msg = counter.to_be_bytes();
    let mut mac = HmacSha1::new_from_slice(&key).expect("hmac key");
    mac.update(&msg);
    let hash = mac.finalize().into_bytes();
    let offset = (hash[19] & 0x0f) as usize;
    let code = ((u32::from(hash[offset] & 0x7f) << 24) | (u32::from(hash[offset+1]) << 16) | (u32::from(hash[offset+2]) << 8) | u32::from(hash[offset+3])) % 1_000_000;
    format!("{:06}", code)
}
