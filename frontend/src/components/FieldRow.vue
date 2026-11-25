<template>
  <div class="card" style="padding:12px;display:flex;gap:10px;align-items:center;margin:8px 0">
    <span v-html="iconSvg" style="width:20px;height:20px;display:inline-flex"></span>
    <div style="flex:1"><label style="font-size:12px;color:#a1a1aa">{{field.label}}</label>
    <input class="field" :type="isSecret && !revealed ? 'password' : 'text'" v-model="field.value" :placeholder="field.placeholder" style="width:100%;background:#111;border:1px solid #333;color:#fff;padding:10px;border-radius:10px" />
    </div>
    <div style="position:relative"><button @click="menu=!menu" aria-label="Field actions">⋮</button>
      <div v-if="menu" class="card" style="position:absolute;right:0;top:28px;z-index:20;padding:8px;width:200px">
        <button @click="$emit('edit-name')">Edit field name</button><br>
        <button @click="$emit('change-type')">Change field type</button><br>
        <button @click="$emit('move-up')">Move field up</button><br>
        <button @click="$emit('move-down')">Move field down</button><br>
        <button @click="$emit('duplicate')">Duplicate field</button><br>
        <button @click="$emit('toggle-hide')">{{field.hidden?'Show field':'Hide field'}}</button><br>
        <button @click="confirmDelete" style="color:#ff6b6b">Delete field</button>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">import {ref,computed} from 'vue'; const props=defineProps<{field:any}>(); const menu=ref(false); const revealed=ref(false); const isSecret=computed(()=>['password','secret','pin','api_key','totp'].includes(props.field.type)); const iconSvg=computed(()=>props.field.icon||'<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white"><rect x="4" y="10" width="16" height="10" rx="2"/><path d="M8 10V7a4 4 0 018 0v3"/></svg>'); function confirmDelete(){ if(confirm(`Delete field "${props.field.label}"?`)) { /* emit */ } }</script>
