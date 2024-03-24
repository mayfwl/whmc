<template>
  <div>
    <div class="w-full relative">
      <n-card class="mb-[24px]" v-for="item in makeslist" ::key="item.id" :title="item.trail_name">
        <div class="w-full flex">
          <div>
            <img :src="item.trail_img" class="rounded-[20px] w-[300px] h-[300px] object-cover" />
          </div>
          <div class="pl-[40px]">
            <div class="w-full flex">
              <h3 class="mr-[20px]">预约人：{{ item.name }}</h3>
              <h3>预约手机号：{{ item.phone }}</h3>
            </div>
            <div class="w-full flex">
              <h3 class="mr-[20px]">参与活动：{{ item.act ? item.act : '无' }}</h3>
              <h3>参与人数：{{ item.perple }}人</h3>
            </div>
            <div class="w-full flex">
              <h3 class="mr-[20px]">开始时间：{{ formatDate(item.starttime) }}</h3>
              <h3>结束时间：{{ formatDate(item.endtime) }}</h3>
            </div>
            <div class="w-full flex">
              <h3 class="mr-[20px]">总金额：RMB {{ item.son }}</h3>
            </div>

            <div>
              <p class="text-[#2B2B2B]">已完成</p>
            </div>
          </div>
        </div>
      </n-card>
    </div>
  </div>
</template>
<script setup lang="ts">
// 获取订单
import { formatDate } from '@/utils/common/time'
import { getorder } from '@/service/api/userinfo'
import { ref } from 'vue'
const makeslist = ref<Trails.ordergoods[]>([])

const getmake = async () => {
  const {
    data: { data }
  } = await getorder()
  makeslist.value = data
  makeslist.value = makeslist.value.filter((i) => i.end != 0)
}

getmake()
</script>
<style lang="scss" scoped></style>
