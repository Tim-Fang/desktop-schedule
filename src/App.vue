<template>
  <n-config-provider :theme="theme">
    <dapp v-model:theme_str="theme_str" />
    <n-global-style />
  </n-config-provider>
</template>
<script setup>
import dapp from './components/HelloWorld.vue'
import { invoke } from '@tauri-apps/api'
import { darkTheme } from 'naive-ui'
import { ref, watch } from 'vue'

// // now we can call our Command!
// // Right-click the application background and open the developer tools.
// // You will see "Hello, World!" printed in the console!
// invoke('greet', { name: 'World' })
//   // `invoke` returns a Promise
//   .then((response) => console.log(response))
const theme = ref(null)
const theme_str = ref('light')
watch(theme_str, async (val) => {
  if (val == 'light') {
    theme.value = null
  } else if (val == 'dark') {
    theme.value = darkTheme
  }
})
</script>

<style>
html {
  background-color: rgba(0, 0, 0, 0.15);
}
</style>
