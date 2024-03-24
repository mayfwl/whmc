<script setup lang="ts">
import type { FormInst, FormItemRule, FormRules } from 'naive-ui'
import { computed, reactive, ref } from 'vue'
import { useMessage } from 'naive-ui'
import { useRouter } from 'vue-router'
import { respwdApi } from '@/service/api/user'
const message = useMessage()
const router = useRouter()
let model = reactive<User.model>({
  phone: '',
  code: null,
  pwd: '',
  name: ''
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
  ],
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
const formRef = ref<FormInst | null>(null)

// 点击获取验证码
const timecode = ref<number>(0)
const codebol = ref<boolean>(false)
const handleCode = () => {
  codebol.value = true
  message.success('发送成功')
  timecode.value = 60
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

// 修改密码请求
const respwd = (e: MouseEvent) => {
  e.preventDefault()

  formRef.value?.validate(async (errors) => {
    if (!errors) {
      const { data } = await respwdApi(model)
      if (data.status === 0) {
        message.success(data.message)
        model = {
          phone: '',
          code: null,
          pwd: '',
          name: ''
        }
        router.push('/login')
      } else message.error(data.message)
    } else {
      message.error('请输入正确信息')
    }
  })
}
</script>

<template>
  <n-gradient-text type="success" class="text-[18px]">重置密码</n-gradient-text>
  <div class="pt-[24px] w-full">
    <n-form :rules="rules" :model="model" ref="formRef" class="w-full">
      <n-form-item path="phone" label="" class="flex flex-col">
        <n-input
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
      <n-form-item path="pwd" label="" class="flex flex-col">
        <n-input
          autosize
          class="w-[300px] md:w-[360px] h-[40px]"
          v-model:value="model.pwd"
          type="password"
          show-password-on="click"
          placeholder="请输入密码"
        />
      </n-form-item>

      <n-space vertical justify="space-between" class="h-[98.4px]">
        <div class="w-[300px] md:w-[360px]">
          <n-button @click="respwd" type="primary" class="w-full h-[40px] rounded-[20px]"
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
