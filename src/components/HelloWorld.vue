<template>
  <n-h2>鱼中课程助手</n-h2>

  <n-card>
    <n-space>
      <n-button @click="theme_str = 'dark'">深色</n-button>
      <n-button @click="theme_str = 'light'">浅色</n-button>
      <n-button>
        <template #icon>
          <n-icon><icon-mdi-account /></n-icon>
        </template>
        幸福
      </n-button>
    </n-space>


  </n-card>
</template>
<script setup>
import { ref } from 'vue'
const theme_str = defineModel('theme_str')

</script>


<!-- <style scoped></style> -->
