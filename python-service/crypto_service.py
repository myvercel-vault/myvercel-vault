# Helper: never log secrets. Used by app.py if you need server-side encryption check.
# Vault encryption is done in browser (Vue crypto.ts) — Python only verifies format, never decrypts.
def is_encrypted_blob(s: str) -> bool:
    return isinstance(s, str) and len(s) > 20
