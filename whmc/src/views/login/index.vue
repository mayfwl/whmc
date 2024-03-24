<script setup lang="ts">
import { computed, type Component } from 'vue'
import { PwdLogin, CodeLogin, Register, ResetPwd } from './components'
import darkModesSwitch from '@/components/common/dark-mode-switch.vue'
interface LoginModule {
  key: UnionKey.LoginModule
  component: Component
}

const modules: LoginModule[] = [
  { key: 'pwd-login', component: PwdLogin },
  { key: 'code-login', component: CodeLogin },
  { key: 'register', component: Register },
  { key: 'reset-pwd', component: ResetPwd }
]

const props = defineProps<{ module?: string }>()

const activeModule = computed<{ component: Component }>(() => {
  const module = modules.filter((item) => item.key === props.module)
  return { component: module[0].component }
})
</script>

<template>
  <div
    class="w-full h-screen bg-no-repeat bg-center bg-cover bg-[url('@/assets/images/bg.svg')] flex justify-center items-center"
  >
    <!-- 灯 -->
    <darkModesSwitch class="absolute top-[24px] left-[48px] z-10" />
    <div>
      <n-card class="w-[366px] md:w-[420px] rounded-[20px] px-[32px] py-[24px]">
        <header class="w-[300px] md:w-[364px] h-[64px] flex justify-between items-center">
          <div class="w-[64px] h-[64px] bg-cover bg-[url('@/assets/images/logo.svg')]"></div>
          <n-gradient-text type="success" class="text-[28px]"
            >武汉露营系统&nbsp;&nbsp;&nbsp;&nbsp;</n-gradient-text
          >
        </header>

        <main class="w-[300px] md:w-[360px] pt-[24px]">
          <KeepAlive> <component :is="activeModule.component"></component> </KeepAlive>
        </main>
      </n-card>
    </div>
  </div>
</template>

<style scoped lang="scss">
.card-tabs .n-tabs-nav--bar-type {
  padding-left: 4px;
}

.n-card {
  :deep(.n-card__content) {
    padding: 0;
  }
}

// 设置svg为背景
</style>
