<template>
  <div>
    <div v-if="!createorder" class="w-[1100px] m-auto">
      <div class="w-full pt-[12px] mb-[18px]">
        <h2 class="m-0 mb-[18px]">请确定并完成订单</h2>
        <p class="m-0 text-[#227950] flex items-center">
          <CheckmarkSharp class="w-[15px] h-[15px] mr-[5px]"></CheckmarkSharp>
          这是一个不错的选择，该营地的评分为{{ order.scores }}
        </p>
      </div>

      <div class="w-full flex justify-between">
        <div class="w-[712.4px]">
          <div
            class="mb-[6px] shadow-md w-[682.4px] h-[33.35px] pl-[18px] pr-[12px] py-[12px] flex items-center"
          >
            <LockClosed class="w-[20px] h-[20px] mr-[10px]"></LockClosed>
            <div class="flex flex-col">
              <p class="m-0 text-[13px] text-[#616161]">已登录 --</p>
              <p class="m-0 text-[16px]">{{ users.phone }}</p>
            </div>
          </div>
          <div class="shadow-md w-[676.4px] p-[18px] mb-[18px]">
            <h2 class="mt-[0px]">由谁来办理信息？</h2>
            <div class="flex items-center">
              <h3 class="m-0 mr-[6px]">营地：{{ order.trail_name }}</h3>
              <p class="m-0">{{ `地点区域：${order.option}，人数：${order.perple}` }}</p>
            </div>
            <div class="flex">
              <p class="m-0 mr-[13px] text-[#227950] text-[12px] flex items-center">
                <CheckmarkSharp class="w-[15px] h-[15px] mr-[5px]"></CheckmarkSharp>
                免费停车
              </p>
              <p class="m-0 flex text-[#227950] text-[12px] items-center">
                <CheckmarkSharp class="w-[15px] h-[15px] mr-[5px]"></CheckmarkSharp>
                免费wifi
              </p>
            </div>

            <n-form
              class="mt-[24px]"
              ref="formRef"
              inline
              :label-width="80"
              :model="user"
              :rules="rules"
              size="medium"
            >
              <n-space vertical>
                <div class="flex">
                  <n-form-item label="姓名：请使用中文输入" path="name">
                    <n-input v-model:value="user.name" placeholder="输入姓名" />
                  </n-form-item>
                  <n-form-item label="姓氏：请使用中文输入" path="xin">
                    <n-input v-model:value="user.xin" placeholder="输入年龄" />
                  </n-form-item>
                </div>
                <div>
                  <n-form-item label="手机号：" path="phone">
                    <n-input v-model:value="user.phone" placeholder="方便与您的联系" />
                  </n-form-item>
                </div>
              </n-space>
            </n-form>
          </div>
          <div class="shadow-md w-[676.4px] p-[18px] mb-[18px]">
            <h2 class="mt-[0px]">取消政策</h2>
            <ul class="list-disc pl-[18px]">
              <li class="text-[13px] text-[#616161]">
                如果在预定时间之后取消或变更，或预定后未来，则需支付一定的平台费。
              </li>
            </ul>
          </div>
          <div class="shadow-md w-[676.4px] p-[18px]">
            <h2 class="mt-[0px]">重要信息</h2>
            <ul class="list-disc pl-[18px]">
              <li class="pb-[6px] text-[13px] text-[#616161]">
                请使用预订确认上的信息提前联系客服，以安排事宜。用户必须提前联系并说明。前台员工将在用户抵达时出面迎接。
              </li>
              <li class="pb-[6px] text-[13px] text-[#616161]">请留意：您将只能取得商业收据</li>
            </ul>
            <n-space vertical>
              <n-checkbox class="mt-[12px]" v-model:checked="checked"
                >我已阅读并理解
                <span class="text-[#227950]">隐私声明</span>
                所述内容，并同意基于隐私声明处理我的个人信息。</n-checkbox
              >
              <div v-if="!checked">
                <n-tooltip trigger="hover">
                  <template #trigger
                    ><n-button :disabled="!checked" size="large" type="primary"
                      >完成预定</n-button
                    ></template
                  >
                  请勾选用户协议
                </n-tooltip>
              </div>
              <div v-else>
                <n-button @click="getorders" :disabled="!checked" size="large" type="primary"
                  >完成预定</n-button
                >
              </div>
            </n-space>
          </div>
        </div>
        <div class="w-[375.6px] flex flex-col">
          <div class="pb-[18px] flex flex-col shadow-md rounded-t-[20px]">
            <div class="relative">
              <img
                class="w-full h-[160.96px] rounded-[20px] object-cover"
                :src="order.trail_img"
                alt=""
              />
              <div
                class="absolute top-0 left-0 w-[100%] h-[160.96px] rounded-[20px] bg-black bg-opacity-30"
              ></div>
            </div>

            <div class="px-[18px]">
              <div class="flex mt-[12px] mb-[18px]">
                <p
                  class="m-0 mr-[4px] w-[33px] h-[24px] text-center rounded-[4px] bg-[#227950] text-[#fff]"
                >
                  {{ order.scores }}
                </p>
                <p class="m-0">{{ scortitle(order.scores) }}</p>
              </div>
              <div class="flex">
                <h4 class="m-0 text-[13px]">营地：</h4>
                <p class="m-0 text-[13px] text-[#616161]">
                  {{ order.trail_name }}，{{ order.perple }}人，{{ order.option }}
                </p>
              </div>
              <div class="flex">
                <h4 class="m-0 text-[13px]">活动：</h4>
                <p v-if="order.act" class="m-0 text-[13px] text-[#616161]">
                  {{ order.act }}
                </p>
                <p class="m-0 text-[13px] text-[#616161]" v-else>暂无参加</p>
              </div>
              <ul class="mt-[18px]">
                <li class="flex">
                  <h4 class="m-0">开始：</h4>
                  <p class="m-0 text-[#616161]">{{ formatDate(order.starttime) }}</p>
                </li>
                <li class="flex">
                  <h4 class="m-0">结束：</h4>
                  <p class="m-0 text-[#616161]">{{ formatDate(order.endtime) }}</p>
                </li>
                <p class="m-0 text-[13px] text-[#616161]">
                  游玩{{ millisecondsToDays(order.endtime - order.starttime) }}天
                </p>
              </ul>
            </div>
          </div>
          <div class="shadow-md p-[12px] my-[18px]">
            <p class="m-0 text-[#227950] flex items-center">
              <CheckmarkSharp class="w-[20px] h-[20px] mr-[5px]"></CheckmarkSharp>
              不错的选择！立即预订，赶在被其他人订完之前！
            </p>
          </div>
          <div class="shadow-md">
            <h2 class="m-0 py-[14.1px] px-[21.1px]">价格详情</h2>
            <div class="p-[18px]">
              <n-space vertical>
                <div class="flex justify-between">
                  <p class="m-0">游玩{{ millisecondsToDays(order.endtime - order.starttime) }}天</p>
                  <p class="m-0">￥{{ order.son - 6 }}元</p>
                </div>
                <div class="flex justify-between">
                  <p class="m-0">平台费</p>
                  <p class="m-0">￥6元</p>
                </div>
                <n-divider />
                <div class="flex justify-between">
                  <h3 class="m-0">总计</h3>
                  <h3 class="m-0">￥{{ order.son }}元</h3>
                </div>
                <div class="flex justify-between text-[#227950]">
                  <h3 class="m-0">现在付款</h3>
                  <h3 class="m-0">￥0元</h3>
                </div>
                <div class="flex justify-between">
                  <p class="m-0">到店付款</p>
                  <p class="m-0 text-[16.38px]">￥{{ order.son }}元</p>
                </div>
              </n-space>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-else class="w-[1100px] m-auto pt-[12px] mb-[18px]">
      <h2 class="m-0 mb-[18px]">预约成功</h2>
      <div class="w-full h-[150px] flex items-center justify-center shadow-md">
        <n-spin size="large" v-if="false" />
        <div v-else>
          <n-space vertical class="w-[1100px] h-[150px] m-auto">
            <n-spin :show="!load" class="h-[150px]">
              <n-alert title="营地预约成功" type="success">
                <n-space vertical>
                  到达目的地后请先联系工作人员，祝你游玩愉快
                  <n-button class="mt-[10px]" @click="$router.push('/trail')" type="primary"
                    >返回营地页面</n-button
                  >
                </n-space>
              </n-alert>
              <template #description>加载中</template>
            </n-spin>
          </n-space>
        </div>
      </div>
    </div>
  </div>
</template>
<script lang="ts" setup>
import { CheckmarkSharp, LockClosed } from '@vicons/ionicons5'
import { ref } from 'vue'
import { scortitle } from '@/utils/index'
import type { FormInst, FormItemRule, FormRules } from 'naive-ui'
import { useMessage } from 'naive-ui'
import { useOrder } from '@/stores/modules/order'
import { useUser } from '@/stores/modules/auth'
import { millisecondsToDays, formatDate } from '@/utils/common/time'
import { createOrder } from '@/service/api/trail'
import { useRouter } from 'vue-router'
const message = useMessage()
// 判断订单是否完成
let createorder = ref<boolean>(false)
// 加载3s
let load = ref<boolean>(false)
const router = useRouter()
const useorder = useOrder()
const useuser = useUser()
const users = useuser.user
const order = useorder.order

const formRef = ref<FormInst | null>(null)

const user = ref<{ name: string; xin: string; phone: number }>({
  name: '李一塞西尔和',
  xin: '李',
  phone: 17371215787
})
const rules: FormRules = {
  name: {
    required: true,
    validator(rule: FormItemRule, value: string) {
      if (!value) {
        return new Error('填写姓名')
      } else if (!/^[\u4e00-\u9fa5]+$/.test(value)) {
        return new Error('请使用中文输入')
      }
      return true
    },
    trigger: ['blur']
  },
  xin: {
    required: true,
    validator(rule: FormItemRule, value: string) {
      if (!value) {
        return new Error('填写姓氏')
      } else if (!/^[\u4e00-\u9fa5]+$/.test(value)) {
        return new Error('请使用中文输入')
      }
      return true
    },
    trigger: ['blur']
  },
  phone: {
    required: true,
    validator(rule: FormItemRule, value: string) {
      if (!value) {
        return new Error('请输入电话号码')
      } else if (!/^1\d{10}$/.test(value)) {
        return new Error('请输入正确的电话号码')
      }
      return true
    },
    trigger: ['input', 'blur']
  }
}

const checked = ref(false)

const getorders = () => {
  formRef.value?.validate(async (errors) => {
    order.name = user.value.name
    order.phone = user.value.phone
    if (!errors) {
      const { data } = await createOrder(order)
      if (data.status === 0) {
        message.success(data.message)
        createorder.value = true
        let i = 2
        const time = setInterval(() => {
          i -= 1
          if (i === 0) {
            load.value = true
            clearInterval(time)
          }
        }, 1000)
      } else message.error(data.message)
    }
  })
}
</script>
<style lang="scss" scoped>
.borders {
  border: 1px solid #ccc;
}
::v-deep(.n-spin-content) {
  height: 150px;
  .n-alert--show-icon {
    height: 150px;
  }
}
</style>
