<template>
  <n-config-provider :theme="theme.naiveTheme">
    <n-message-provider>
      <transition name="slide" mode="out-in"> <RouterView /> </transition
    ></n-message-provider>
    <n-global-style />
  </n-config-provider>
</template>

<script setup lang="ts">
import { RouterView } from 'vue-router'
import { useThemeStore } from './stores/modules/theme'

const theme = useThemeStore() // 主题变量
</script>

<style>
.slide-enter-active,
.slide-leave-active {
  transition: transform 0.9s;
}
.slide-enter-from {
  transform: translateX(100%);
}
.slide-leave-to {
  transform: translateX(-100%);
}
</style>
