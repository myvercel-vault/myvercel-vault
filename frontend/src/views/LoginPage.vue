<template><main style="max-width:420px;margin:120px auto;padding:16px"><div class="card" style="padding:24px">
<h1 style="text-align:center">Welcome back</h1><p style="text-align:center;color:#a1a1aa">Sign in to MyVercel Vault</p>
<!-- MAIN: Email + Password ONLY. No Username here. -->
<label>Email</label><input class="field" v-model="email" placeholder="Email" style="width:100%;padding:12px;border-radius:10px;background:#111;border:1px solid #333;color:#fff" />
<label>Password</label><input class="field" type="password" v-model="password" placeholder="Password" style="width:100%;padding:12px;border-radius:10px;background:#111;border:1px solid #333;color:#fff" />
<p v-if="err" style="color:#ff6b6b">{{err}}</p>
<button class="btn-primary" style="width:100%;margin-top:12px" @click="doLogin">Sign In</button>
<p style="text-align:center;color:#a1a1aa;margin:16px 0">or continue with</p>
<button style="width:100%;padding:12px;border-radius:999px" @click="setup('Google')">Login with Google</button>
<button style="width:100%;padding:12px;border-radius:999px;margin-top:8px" @click="setup('GitHub')">Sign in with GitHub</button>
<!-- Forgot password: LINK ONLY, at bottom under Google section -->
<p style="text-align:center;margin-top:12px"><RouterLink to="/forgot-password" style="color:#fff;text-decoration:underline">Forgot password?</RouterLink></p>
<hr style="border-color:#262626;margin:20px 0" />
<!-- ONLY ONE Create button here -->
<RouterLink to="/create-account" class="btn-primary" style="display:block;text-align:center;text-decoration:none">Create an Account</RouterLink>
<p style="text-align:center;margin-top:12px"><RouterLink to="/other-signin" style="color:#a1a1aa">Use another sign-in method</RouterLink></p>
<div v-if="showSetup" class="card" style="padding:12px;margin-top:12px"><b>Setup Required: {{provider}}</b><p style="color:#a1a1aa">Set GOOGLE/GITHUB_CLIENT_ID, SECRET and REDIRECT_URI in .env. No fake login.</p><button @click="showSetup=false">Close</button></div>
</div></main></template>
<script setup lang="ts">import {ref} from 'vue'; import {useRouter} from 'vue-router'; import {useAuth} from '../stores/auth'; const email=ref(''); const password=ref(''); const err=ref(''); const showSetup=ref(false); const provider=ref(''); const auth=useAuth(); const router=useRouter(); async function doLogin(){ try{ await auth.login(email.value,password.value); router.push('/vault') }catch(e:any){ err.value=e.message } } function setup(p:string){ provider.value=p; showSetup.value=true }</script>
