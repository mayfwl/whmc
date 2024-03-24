<template>
  <div>
    <div>
      <div class="w-[1100px] m-auto borders">
        <div class="w-full h-[48px] p-[8px] flex items-center">
          <n-button text @click="$router.go(-1)">
            <template #icon>
              <n-icon>
                <ArrowBackOutline />
              </n-icon>
            </template>
            返回
          </n-button>
        </div>
        <div class="w-full h-[286px] flex justify-between">
          <div class="w-[549px] h-full">
            <img class="w-full h-full object-cover" :src="trail.himg" alt="" />
          </div>
          <div class="w-[549px] h-full flex flex-wrap justify-between content-between">
            <img
              v-for="i in trail.results"
              class="w-[273.5px] h-[142px] object-cover"
              :src="i.trail_src"
              alt=""
            />
          </div>
        </div>
      </div>
      <div>
        <div class="m-auto w-[1100px] bordertp">
          <div class="w-full h-[44px] flex justify-between items-center">
            <div></div>
            <div class="mr-[20px]">
              <!-- 点击结算的时候结算信息就会被存储 -->
              <n-button type="primary" class="rounded-[20px]" @click="getorder"
                >预定营地 (￥{{ trail.son + 6 }})</n-button
              >
            </div>
          </div>
        </div>
      </div>

      <div class="m-auto w-[1100px]">
        <div
          class="flex justify-between w-[952px] mb-[12px] h-[474.750px] rounded-[20px] px-[74px] py-[12px] bordera"
        >
          <div class="w-[633.325px] pr-[12px] h-[474.750px]">
            <div class="flex flex-col">
              <div class="pt-12px pb-[16px]">
                <p class="m-0 text-[32px]">{{ trail.name }}</p>
                <p class="m-0 text-[14px]">{{ trail.enname }}</p>
                <p class="m-0 mt-[10px] text-[16px]">{{ trail.option }}{{ trail.address }}</p>
              </div>
              <div class="flex pb-[24px]">
                <n-space>
                  <p class="m-0 flex text-[#227950]">
                    <CheckmarkOutline class="w-[24px]"></CheckmarkOutline>
                    现在预定，到点付款
                  </p>
                  <p class="m-0 flex text-[#227950]">
                    <CheckmarkOutline class="w-[24px]"></CheckmarkOutline> 可全额退款
                  </p>
                </n-space>
              </div>
              <div class="flex pb-[24px]">
                <p
                  class="m-0 mr-[5px] w-[33px] h-[24px] text-center rounded-[4px] bg-[#227950] text-[#fff]"
                >
                  {{ trail.scor }}
                </p>
                <p class="m-0 text-[16px]">{{ scortitle(trail.scor) }}</p>
              </div>
              <div>
                <h3 class="m-0 pb-[12px] text-[16px]">携带设备</h3>
                <div class="w-full h-[86px] flex flex-wrap content-between justify-between">
                  <div class="w-[308.66px] h-[18px] flex items-center">
                    <img src="https://api.iconify.design/gis:map-o.svg" alt="" />
                    <p class="m-0 ml-[6px]">路书</p>
                  </div>
                  <div class="w-[308.66px] h-[18px] flex items-center">
                    <img
                      src="https://api.iconify.design/fluent-emoji-high-contrast:blue-book.svg"
                      alt=""
                    />
                    <p class="m-0 ml-[6px]">笔记本</p>
                  </div>
                  <div class="w-[308.66px] h-[18px] flex items-center">
                    <img
                      src="https://api.iconify.design/fluent-emoji-high-contrast:baguette-bread.svg"
                      alt=""
                    />
                    <p class="m-0 ml-[6px]">食物</p>
                  </div>
                  <div class="w-[308.66px] h-[18px] flex items-center">
                    <img
                      src="https://api.iconify.design/material-symbols:android-camera.svg"
                      alt=""
                    />
                    <p class="m-0 ml-[6px]">摄影器材</p>
                  </div>
                  <div class="w-[308.66px] h-[18px] flex items-center">
                    <img src="https://api.iconify.design/material-symbols:backpack.svg" alt="" />
                    <p class="m-0 ml-[6px]">背包</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="w-[310.67px] h-[462px] mt-[12px]">
            <div>
              <h3 class="m-0 mb-[12px]">活动</h3>
              <div v-if="trail.act === 1">
                <img class="rounded-[12px] w-[310px] h-[174px]" :src="activate.img" alt="" />
                <div class="flex justify-between">
                  <h3 class="m-0">{{ activate.name }}</h3>
                  <n-button type="text" class="text-[#227950]">详情></n-button>
                </div>
                <p class="m-0">
                  参与活动 <n-checkbox v-model:checked="isCheck" style="margin-right: 12px" />
                </p>
              </div>
              <div v-else>暂无活动</div>
            </div>
            <div>
              <h3>预订信息</h3>
              <n-space vertical>
                <div>
                  <!-- 日期 -->
                  <n-date-picker
                    v-model:value="trailStore.range"
                    size="large"
                    type="daterange"
                    clearable
                  />
                </div>
                <div>
                  <n-input-number v-model:value="trailStore.popuer" :min="1" :max="15" size="large">
                    <template #suffix> 位旅客 </template>
                  </n-input-number>
                </div>
              </n-space>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import { ArrowBackOutline, CheckmarkOutline } from '@vicons/ionicons5'
import { ref } from 'vue'
import { scortitle } from '@/utils/index'
import { useTrailStore } from '@/stores/modules/trail'
import { useRoute } from 'vue-router'
import { getTrailById, getTrailsByAct } from '@/service/api/trail'
import { useOrder } from '@/stores/modules/order'
import { router } from '@/router'
import { millisecondsToDays } from '@/utils/common/time'
const route = useRoute()
const trailStore = useTrailStore()
const orders = useOrder()
const order = orders.order

// 加载一下数据
const trail = ref<Trails.trails>({
  id: 0,
  name: '',
  himg: '',
  option: '',
  x: 0,
  y: 0,
  optype: '',
  son: 0,
  act: 0,
  scor: 0,
  enname: '',
  address: '',
  results: []
})
const activate = ref<Trails.activate>({
  id: 0,
  name: '',
  img: '',
  title: '',
  yid: 0,
  yname: '',
  people: 0
})

const gettrail = async () => {
  const {
    data: { data }
  } = await getTrailById(
    // 这里获取的router.params.id是一个string类
    parseInt(Array.isArray(route.params.name) ? route.params.name[0] : route.params.name)
  )

  trail.value = data

  if (data.act === 1) {
    // 获取对应活动
    const {
      data: { data }
    } = await getTrailsByAct(
      parseInt(Array.isArray(route.params.name) ? route.params.name[0] : route.params.name)
    )
    activate.value = data
  }
  return trail
}
gettrail()
// 是否参加活动？
const isCheck = ref<boolean>(false)

// 进入订单页面，保存订单
const getorder = () => {
  // 将商品信息保存到订单里
  order.trail_name = trail.value.name
  order.son =
    trail.value.son *
      (millisecondsToDays(trailStore.range[1]) - millisecondsToDays(trailStore.range[1])) +
    6
  order.starttime = trailStore.range[0]
  order.endtime = trailStore.range[1]
  order.trail_img = trail.value.himg
  order.perple = trailStore.popuer
  order.scores = trail.value.scor
  order.option = trail.value.option
  if (activate.value.id != 0 && isCheck.value) {
    order.act = activate.value.name
  } else {
    order.act = ''
  }
  router.push('/accounts')
}
</script>

<style lang="scss" scoped>
.borders {
  border-left: 1px solid #ccc;
  border-right: 1px solid #ccc;
}
.bordertp {
  border-left: 1px solid #ccc;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
.bordera {
  border: 1px solid #ccc;
}
</style>
