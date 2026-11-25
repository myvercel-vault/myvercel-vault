# MyVercel Vault — Python Service (FastAPI)
# Endpoints: password generator, TOTP, R2 presigned URLs, health.
# No secrets are logged. R2 keys come from env only.
from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
import secrets, string, random, os, boto3
from botocore.config import Config

app = FastAPI(title="MyVercel Vault Python Service")
app.add_middleware(CORSMiddleware, allow_origins=["http://localhost:5173"], allow_methods=["*"], allow_headers=["*"])

WORDS = ["apple","river","vault","tiger","moon","cloud","falcon","amber","ocean","solar","pixel","ember","nova","cedar","maple","echo"]

@app.get("/health")
def health():
    return {"ok": True, "r2": bool(os.getenv("R2_BUCKET")), "neon": "configured" if os.getenv("DATABASE_URL") else "Setup Required"}

@app.get("/generate-password")
def generate_password(type: str = "Random Password", length: int = 18, upper: bool=True, lower: bool=True, numbers: bool=True, symbols: bool=True, capitalize: bool=True):
    if type == "Memorable Password":
        words = [random.choice(WORDS) for _ in range(length)]
        if capitalize: words = [w.capitalize() for w in words]
        return {"password": "-".join(words), "unit": "words"}
    chars = ""
    if upper: chars += string.ascii_uppercase
    if lower: chars += string.ascii_lowercase
    if numbers: chars += string.digits
    if symbols: chars += "!@#$%^&*"
    if not chars: raise HTTPException(400, "Select at least one charset")
    pw = "".join(secrets.choice(chars) for _ in range(length))
    return {"password": pw, "unit": "characters"}

@app.get("/totp")
def totp(secret: str = Query(...)):
    # TOTP via pyotp — WASM in browser does the same fast path; Python is server fallback.
    import pyotp
    try:
        totp_obj = pyotp.TOTP(secret)
        return {"code": totp_obj.now(), "remaining": 30 - (int(__import__('time').time()) % 30)}
    except Exception as e:
        raise HTTPException(400, str(e))

def r2_client():
    if not os.getenv("R2_ACCESS_KEY_ID"): raise HTTPException(500, "Setup Required: R2 not configured")
    return boto3.client("s3", endpoint_url=os.getenv("R2_ENDPOINT"), aws_access_key_id=os.getenv("R2_ACCESS_KEY_ID"), aws_secret_access_key=os.getenv("R2_SECRET_ACCESS_KEY"), config=Config(signature_version="s3v4"), region_name="auto")

@app.get("/r2/presigned-upload")
def presigned_upload(key: str, mime: str = "application/octet-stream"):
    c = r2_client()
    url = c.generate_presigned_url("put_object", Params={"Bucket": os.getenv("R2_BUCKET"), "Key": key, "ContentType": mime}, ExpiresIn=300)
    return {"url": url, "key": key}

@app.get("/r2/presigned-download")
def presigned_download(key: str):
    c = r2_client()
    url = c.generate_presigned_url("get_object", Params={"Bucket": os.getenv("R2_BUCKET"), "Key": key}, ExpiresIn=300)
    return {"url": url}
