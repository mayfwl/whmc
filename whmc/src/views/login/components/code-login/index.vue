<script setup lang="ts">
import type { FormInst, FormItemRule, FormRules } from 'naive-ui'
import { ref, reactive, computed } from 'vue'
import { useMessage } from 'naive-ui'
import { useRouter } from 'vue-router'
import { codeApi, codeapi } from '@/service/api/user'
const message = useMessage()
const router = useRouter()
const formRef = ref<FormInst | null>(null)

let model = reactive<{ phone: string; code: string }>({
  phone: '',
  code: ''
})

const rules: FormRules = {
  phone: [
    {
      required: true,
      validator(rule: FormItemRule, value: string) {
        if (!value) {
          return new Error('请输入电话号码')
        } else if (!/^1\d{10}$/.test(value)) {
          return new Error('请输入正确的电话号码')
        }
        return true
      },
      trigger: 'blur'
    }
  ],
  code: [
    {
      required: true,
      validator(rule: FormItemRule, value: string) {
        if (!/^\d{6}$/.test(value)) {
          return new Error('请输入6位验证码')
        }
        return true
      },
      trigger: 'blur'
    }
  ]
}
let code: string = ''
const handleV = (e: MouseEvent) => {
  e.preventDefault() //阻止默认行为
  if (code === model.code) {
    formRef.value?.validate(async (errors) => {
      if (!errors) {
        const { data } = await codeApi(model)
        if (data.status === 0) {
          message.success(data.message)
          model = {
            phone: '',
            code: ''
          }
          router.push('/')
        } else message.error(data.message)
      } else {
        message.error('请输入正确的验证码')
      }
    })
  } else {
    message.error('请输入正确的验证码')
  }
}

// 点击获取验证码
const timecode = ref<number>(0)
const codebol = ref<boolean>(false)
const handleCode = async () => {
  codebol.value = true
  message.success('发送成功')
  timecode.value = 60

  //请求短信验证码接口
  const { data } = await codeapi(model.phone)
  code = data.data
  const times = setInterval(() => {
    timecode.value = timecode.value - 1

    if (timecode.value === 0) {
      codebol.value = false
      clearInterval(times)
    }
  }, 1000)
}
const codehand = computed(() => {
  return !codebol.value ? '获取验证码' : timecode.value + '秒重新获取'
})
</script>

<template>
  <n-gradient-text type="success" class="text-[18px]">验证码登录</n-gradient-text>
  <div class="pt-[24px] w-full">
    <n-form :model="model" ref="formRef" class="w-full" :rules="rules">
      <n-form-item path="phone" class="flex flex-col">
        <n-input
          ref="formRef"
          autosize
          class="w-[300px] md:w-[360px] h-[40px]"
          v-model:value="model.phone"
          type="text"
          placeholder="请输入手机号"
        />
      </n-form-item>
      <n-form-item path="code" label="" class="flex flex-col">
        <n-space justify="space-between">
          <n-input
            autosize
            class="w-[178px] md:w-[237px] h-[40px]"
            v-model:value="model.code"
            show-password-on="click"
            placeholder="请输入验证码"
          />
          <n-button @click="handleCode" :disabled="codebol" class="h-[40px] w-[110px]">{{
            codehand
          }}</n-button>
        </n-space>
      </n-form-item>

      <n-space vertical justify="space-between" class="h-[98.4px]">
        <div class="w-[300px] md:w-[360px]">
          <n-button type="primary" class="w-full h-[40px] rounded-[20px]" @click="handleV"
            >确认</n-button
          >
        </div>
        <div class="w-[300px] md:w-[360px]">
          <n-button class="w-full h-[40px] rounded-[20px]" @click="$router.push('/login')"
            >返回</n-button
          >
        </div>
      </n-space>
    </n-form>
  </div>
</template>
