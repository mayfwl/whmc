<script setup lang="ts">
import { ref, reactive, computed } from 'vue'
import { useMessage } from 'naive-ui'
import loginAgreement from '@/components/custom/login-agreement.vue'
import type { FormInst, FormItemRule, FormRules } from 'naive-ui'
import { codeapi, resApi } from '@/service/api/user'
import { useRouter } from 'vue-router'
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
// 是否勾选了用户协议
const agreement = ref<boolean>(false)
let code: string = ''
const formRef = ref<FormInst | null>(null)
const handleV = (e: MouseEvent) => {
  e.preventDefault() //阻止默认行为
  if (code === model.code) {
    formRef.value?.validate(async (errors) => {
      if (!errors) {
        const { data } = await resApi(model)
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
        message.error('请输入正确的注册信息')
      }
    })
  } else {
    formRef.value?.validate(async (errors) => {
      if (!errors) {
        const { data } = await resApi(model)
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
        message.error('请输入正确的注册信息')
      }
    })
  }
}

// 点击获取验证码
const timecode = ref<number>(0)
const codebol = ref<boolean>(false)
const handleCode = async () => {
  codebol.value = true
  message.success('发送成功')
  //请求短信验证码接口
  const { data } = await codeapi(model.phone)
  code = data.data

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
</script>

<template>
  <n-gradient-text type="success" class="text-[18px]">注册密码</n-gradient-text>
  <div class="pt-[24px] w-full">
    <n-form :model="model" ref="formRef" class="w-full" :rules="rules">
      <n-form-item path="phone" class="flex flex-col">
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
      <n-form-item path="name" label="" class="flex flex-col">
        <n-input
          autosize
          class="w-[300px] md:w-[360px] h-[40px]"
          show-password-on="click"
          v-model:value="model.name"
          placeholder="请输入用户名"
        />
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
      <n-space vertical justify="space-between" class="h-[138.4px]">
        <login-agreement v-model:value="agreement" />
        <div v-if="!agreement" class="w-[300px] md:w-[360px]">
          <n-tooltip trigger="hover">
            <template #trigger>
              <n-button
                :disabled="!agreement"
                type="primary"
                class="w-full h-[40px] rounded-[20px]"
                @click="handleV"
                >确认</n-button
              ></template
            >
            请勾选用户协议
          </n-tooltip>
        </div>
        <div v-if="agreement" class="w-[300px] md:w-[360px]">
          <n-button
            :disabled="!agreement"
            type="primary"
            class="w-full h-[40px] rounded-[20px]"
            @click="handleV"
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
