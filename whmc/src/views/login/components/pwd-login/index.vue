<script setup lang="ts">
import type { FormInst, FormItemRule, FormRules } from 'naive-ui'
import { reactive, ref } from 'vue'
import { useMessage } from 'naive-ui'
import { useRouter } from 'vue-router'
import { pwdLoginApi } from '@/service/api/user'
import { useUser } from '@/stores/modules/auth/index'
const useuser = useUser()
const message = useMessage()
const router = useRouter()
const formRef = ref<FormInst | null>(null)
const model = reactive<{ pwd: string; name: string }>({
  pwd: '123456',
  name: 'lyfs'
})

const rules: FormRules = {
  pwd: [
    {
      required: true,
      validator(rule: FormItemRule, value: string) {
        if (!value) {
          return new Error('请输入密码')
        } else if (!/^[a-zA-Z0-9]{6,16}$/.test(value)) {
          return new Error('密码应为6-16的字符和数字')
        }
        return true
      },
      trigger: 'blur'
    }
  ],
  name: [
    {
      required: true,
      validator(rule: FormItemRule, value: string) {
        if (!value) {
          return new Error('请输入用户名')
        } else if (!/^[a-zA-Z][a-zA-Z0-9]{3,16}$/.test(value)) {
          return new Error('用户名应为英文和数字组成的4-16位字符')
        }
        return true
      },
      trigger: 'blur'
    }
  ]
}
const login = async (e: MouseEvent) => {
  e.preventDefault() //阻止默认行为
  // 发送登录请求
  formRef.value?.validate(async (errors) => {
    if (!errors) {
      const { data } = await pwdLoginApi(model)
      if (data.status === 0) {
        message.success(data.message)
        useuser.setToken(data.token)

        router.push('/')
      } else message.error(data.message)
    } else {
      message.error('请输入正确登录信息')
    }
  })
}
</script>

<template>
  <n-gradient-text type="success" class="text-[18px]">密码登录</n-gradient-text>
  <div class="pt-[24px] w-full">
    <n-form :model="model" ref="formRef" class="w-full" :rules="rules">
      <n-form-item path="name" label="" class="flex flex-col">
        <n-input
          autosize
          class="w-[300px] md:w-[360px] h-[40px]"
          v-model:value="model.name"
          type="text"
          placeholder="用户名"
        />
      </n-form-item>
      <n-form-item path="pwd" label="" class="flex flex-col">
        <n-input
          autosize
          class="w-[300px] md:w-[360px] h-[40px]"
          v-model:value="model.pwd"
          type="password"
          show-password-on="click"
          placeholder="密码"
        />
      </n-form-item>
      <n-space vertical justify="space-between" class="h-[144.4px]">
        <div class="w-[300px] md:w-[360px] flex flex-row-reverse">
          <n-button text @click="$router.push('/login/reset-pwd')">忘记密码？</n-button>
        </div>
        <div class="w-[300px] md:w-[360px]">
          <n-button type="primary" class="w-full h-[40px] rounded-[20px]" @click="login"
            >确认</n-button
          >
        </div>
        <div class="w-[300px] md:w-[360px] flex justify-between">
          <n-button
            class="w-[116px] md:w-[174px] h-[34px]"
            @click="$router.push('/login/code-login')"
            >验证码登录</n-button
          >
          <n-button class="w-[116px] md:w-[174px] h-[34px]" @click="$router.push('/login/register')"
            >注册账号</n-button
          >
        </div>
      </n-space>
      <n-space vertical justify="center" class="w-[300px] md:w-[360px] h-[88.4px]">
        <n-divider class="m-0">其他账号登录</n-divider>
        <n-space justify="space-evenly">
          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 512 512">
            <path
              fill="currentColor"
              d="M256 32C132.3 32 32 134.9 32 261.7c0 101.5 64.2 187.5 153.2 217.9a17.56 17.56 0 0 0 3.8.4c8.3 0 11.5-6.1 11.5-11.4c0-5.5-.2-19.9-.3-39.1a102.4 102.4 0 0 1-22.6 2.7c-43.1 0-52.9-33.5-52.9-33.5c-10.2-26.5-24.9-33.6-24.9-33.6c-19.5-13.7-.1-14.1 1.4-14.1h.1c22.5 2 34.3 23.8 34.3 23.8c11.2 19.6 26.2 25.1 39.6 25.1a63 63 0 0 0 25.6-6c2-14.8 7.8-24.9 14.2-30.7c-49.7-5.8-102-25.5-102-113.5c0-25.1 8.7-45.6 23-61.6c-2.3-5.8-10-29.2 2.2-60.8a18.64 18.64 0 0 1 5-.5c8.1 0 26.4 3.1 56.6 24.1a208.21 208.21 0 0 1 112.2 0c30.2-21 48.5-24.1 56.6-24.1a18.64 18.64 0 0 1 5 .5c12.2 31.6 4.5 55 2.2 60.8c14.3 16.1 23 36.6 23 61.6c0 88.2-52.4 107.6-102.3 113.3c8 7.1 15.2 21.1 15.2 42.5c0 30.7-.3 55.5-.3 63c0 5.4 3.1 11.5 11.4 11.5a19.35 19.35 0 0 0 4-.4C415.9 449.2 480 363.1 480 261.7C480 134.9 379.7 32 256 32"
            />
          </svg>
          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 20 20">
            <path
              fill="currentColor"
              d="M14 7.3c3.2 0 6 2.258 6 5.007c0 1.472-1.1 2.846-2.5 3.926L18 18l-1.9-1.08c-.7.196-1.4.393-2.1.393c-3.4 0-6-2.258-6-5.006C8 9.558 10.7 7.3 14 7.3M7 2c3.5 0 6.5 2.061 7.3 4.81h-.7c-3.4 0-5.999 2.454-5.999 5.497c0 .49.1.981.2 1.472h-.7c-.9 0-1.6-.196-2.5-.393l-2.5 1.178l.699-2.06C1.1 11.324 0 9.753 0 7.89C0 4.552 3.1 2 7 2m5.1 8.049c-.3 0-.7.393-.7.687c0 .392.3.687.7.687c.5 0 .9-.392.9-.687c0-.393-.4-.687-.9-.687m3.8 0c-.3 0-.7.393-.7.687c0 .392.4.687.7.687c.6 0 .9-.392.9-.687c0-.393-.4-.687-.9-.687M4.8 4.846c-.6 0-1.1.393-1.1.884c0 .589.6.884 1.1.884c.5 0 .8-.295.9-.884c0-.59-.4-.884-.9-.884m4.9 0c-.6 0-1.1.393-1.1.884c0 .589.6.884 1.1.884c.5 0 .9-.295.9-.884c0-.59-.4-.884-.9-.884"
            />
          </svg>
          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 16 16">
            <g fill="currentColor">
              <path
                d="M6.048 3.323c.022.277-.13.523-.338.55c-.21.026-.397-.176-.419-.453c-.022-.277.13-.523.338-.55c.21-.026.397.176.42.453Zm2.265-.24c-.603-.146-.894.256-.936.333c-.027.048-.008.117.037.15c.045.035.092.025.119-.003c.361-.39.751-.172.829-.129l.011.007c.053.024.147.028.193-.098c.023-.063.017-.11-.006-.142c-.016-.023-.089-.08-.247-.118"
              />
              <path
                d="M11.727 6.719c0-.022.01-.375.01-.557c0-3.07-1.45-6.156-5.015-6.156c-3.564 0-5.014 3.086-5.014 6.156c0 .182.01.535.01.557l-.72 1.795a25.85 25.85 0 0 0-.534 1.508c-.68 2.187-.46 3.093-.292 3.113c.36.044 1.401-1.647 1.401-1.647c0 .979.504 2.256 1.594 3.179c-.408.126-.907.319-1.228.556c-.29.213-.253.43-.201.518c.228.386 3.92.246 4.985.126c1.065.12 4.756.26 4.984-.126c.052-.088.088-.305-.2-.518c-.322-.237-.822-.43-1.23-.557c1.09-.922 1.594-2.2 1.594-3.178c0 0 1.041 1.69 1.401 1.647c.168-.02.388-.926-.292-3.113a25.78 25.78 0 0 0-.534-1.508l-.72-1.795ZM9.773 5.53a.095.095 0 0 1-.009.096c-.109.159-1.554.943-3.033.943h-.017c-1.48 0-2.925-.784-3.034-.943a.098.098 0 0 1-.018-.055c0-.015.004-.028.01-.04c.13-.287 1.43-.606 3.042-.606h.017c1.611 0 2.912.319 3.042.605m-4.32-.989c-.483.022-.896-.529-.922-1.229c-.026-.7.344-1.286.828-1.308c.483-.022.896.529.922 1.23c.027.7-.344 1.286-.827 1.307Zm2.538 0c-.484-.022-.854-.607-.828-1.308c.027-.7.44-1.25.923-1.23c.483.023.853.608.827 1.309c-.026.7-.439 1.251-.922 1.23ZM2.928 8.99c.213.042.426.081.639.117v2.336s1.104.222 2.21.068V9.363c.326.018.64.026.937.023h.017c1.117.013 2.474-.136 3.786-.396c.097.622.151 1.386.097 2.284c-.146 2.45-1.6 3.99-3.846 4.012h-.091c-2.245-.023-3.7-1.562-3.846-4.011c-.054-.9 0-1.663.097-2.285"
              />
            </g>
          </svg>
        </n-space>
      </n-space>
    </n-form>
  </div>
</template>

<style scoped lang="scss">
.n-divider:not(.n-divider--vertical) {
  margin-bottom: 0;
}
</style>
