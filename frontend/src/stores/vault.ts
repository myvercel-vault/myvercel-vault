import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { useAuth } from './auth'
// Vault items are ENCRYPTED blobs from Ruby/Neon. Frontend decrypts with password-derived key via crypto.ts (never sent to search service).
export const useVault = defineStore('vault',()=>{
  const items=ref<any[]>([]); const query=ref('')
  async function load(){ const a=useAuth(); const res=await fetch('/api/vault',{headers:{Authorization:`Bearer ${a.token}`}}); items.value=await res.json() }
  // Live search: only Title, Website, Username, Email, non-secret field names. Never Password/PIN/API Key/Secret/TOTP.
  const filtered=computed(()=>{ const q=query.value.trim().toLowerCase(); if(!q) return items.value; const score=(it:any)=>{ const t=(it.title||'').toLowerCase(); if(t.startsWith(q)) return 0; if(t.includes(q)) return 1; if((it.website||'').toLowerCase().includes(q)||(it.username||'').toLowerCase().includes(q)) return 2; return 3 }; return [...items.value].filter(it=> [it.title,it.website,it.username,it.email,it.type].join(' ').toLowerCase().includes(q)).sort((a,b)=>score(a)-score(b)) })
  return {items,query,filtered,load}
})
