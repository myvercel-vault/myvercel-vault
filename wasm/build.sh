#!/bin/bash
# Build Rust -> WASM, output to frontend/public/wasm/crypto.wasm
# Requires: cargo + wasm-pack
set -e
cd wasm/rust
wasm-pack build --target no-modules --out-dir ../../frontend/public/wasm
# Also copy loader: frontend/src/lib/wasm-loader.ts expects /wasm/crypto.wasm
echo "Built: frontend/public/wasm/crypto.wasm"
