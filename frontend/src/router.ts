import { createRouter, createWebHistory } from 'vue-router'
import { useAuth } from './stores/auth'
const routes=[{path:'/',component:()=>import('./views/LandingPage.vue')},{path:'/login',component:()=>import('./views/LoginPage.vue')},{path:'/create-account',component:()=>import('./views/CreateAccountPage.vue')},{path:'/forgot-password',component:()=>import('./views/ForgotPasswordPage.vue')},{path:'/other-signin',component:()=>import('./views/OtherSignInPage.vue')},{path:'/vault',component:()=>import('./views/MyVaultPage.vue'),meta:{auth:true}},{path:'/new-item',component:()=>import('./views/NewItemPage.vue'),meta:{auth:true}},{path:'/settings',component:()=>import('./views/SettingsPage.vue'),meta:{auth:true}}]
const r=createRouter({history:createWebHistory(),routes})
r.beforeEach((to)=>{ const a=useAuth(); if(to.meta.auth && !a.isAuthed) return '/login' })
export default r
