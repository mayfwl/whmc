<template>
  <n-icon size="25" @click="changetheme" :component="theme.darkModes ? MoonOutline : Sunny" />
</template>

<script setup lang="ts">
import { useThemeStore } from '@/stores/modules/theme'
import { Sunny, MoonOutline } from '@vicons/ionicons5'
const theme = useThemeStore() // 主题变量
const changetheme = () => {
  theme.darkModes = !theme.darkModes
}
</script>
