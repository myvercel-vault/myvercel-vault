import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
export const useAuth = defineStore('auth',()=>{
  const token=ref(localStorage.getItem('mv_token')||''); const user=ref<any>(JSON.parse(localStorage.getItem('mv_user')||'null'))
  const isAuthed=computed(()=>!!token.value)
  async function login(email:string,password:string){ const res=await fetch('/api/auth/login',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({email,password})}); if(!res.ok) throw new Error((await res.json()).error||'Login failed'); const d=await res.json(); token.value=d.token; user.value=d.user; localStorage.setItem('mv_token',d.token); localStorage.setItem('mv_user',JSON.stringify(d.user)); return d }
  async function loginUsername(username:string,password:string){ const res=await fetch('/api/auth/login-username',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({username,password})}); if(!res.ok) throw new Error('Login failed'); const d=await res.json(); token.value=d.token; user.value=d.user; localStorage.setItem('mv_token',d.token); localStorage.setItem('mv_user',JSON.stringify(d.user)); }
  async function createAccount(payload:any){ const res=await fetch('/api/auth/register',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(payload)}); if(!res.ok) throw new Error((await res.json()).error||'Create failed'); return login(payload.email,payload.password) }
  function logout(){ token.value=''; user.value=null; localStorage.clear() }
  return {token,user,isAuthed,login,loginUsername,createAccount,logout}
})
