<template>
  <div>
    <div class="w-full h-[40px] pt-[24px]">
      <div class="m-auto w-[1100px] flex justify-between items-center">
        <!-- 地点 -->
        <div>
          <n-mention
            ref="mentionRef"
            class="w-[310px] h-[40px]"
            size="large"
            :options="options"
            v-model:value="tempOption"
            @blur="updateOption"
            @keydown.enter="
              (event: KeyboardEvent) => {
                if (event.target) (event.target as HTMLElement).blur()
              }
            "
          />
        </div>
        <div>
          <!-- 日期 -->
          <n-date-picker v-model:value="trailStore.range" size="large" type="daterange" clearable />
        </div>
        <div>
          <n-input-number v-model:value="trailStore.popuer" :min="1" :max="15" size="large">
            <template #suffix> 位旅客 </template>
          </n-input-number>
        </div>
      </div>
    </div>
    <div class="w-[1100px] m-auto mt-[16px]">
      <div class="w-full flex justify-between">
        <div class="w-[236px] flex flex-col mb-[24px]">
          <div class="w-full rounded-[20px] bodermap flex flex-col">
            <n-image height="101px" width="236px" src="/public/img/map.png" alt="" lazy />
            <div class="w-full h-[42px]">
              <n-button class="w-full h-full" text>显示地图</n-button>
            </div>
          </div>

          <div class="w-full">
            <p class="text-[20px] py-[24px] m-0 mt-[24px] borderp">筛选</p>
            <n-space vertical>
              <n-radio-group class="mb-[24px]" v-model:value="son" name="radiogroup">
                <n-space vertical>
                  <p class="m-0">价格</p>
                  <n-radio v-for="song in songs" :key="song.value" :value="song.value">
                    {{ song.label }}
                  </n-radio>
                </n-space>
              </n-radio-group>
              <!-- 有无活动 -->
              <n-radio-group class="mb-[24px]" v-model:value="act" name="radiogroup">
                <n-space vertical>
                  <p class="m-0">活动</p>
                  <n-radio v-for="ac in acts" :key="ac.value" :value="ac.value">
                    {{ ac.label }}
                  </n-radio>
                </n-space>
              </n-radio-group>
              <!-- 评分 -->
              <n-radio-group class="mb-[24px]" v-model:value="scor" name="radiogroup">
                <n-space vertical>
                  <p class="m-0">评分</p>
                  <n-radio v-for="scor in scores" :key="scor.value" :value="scor.value">
                    {{ scor.label }}
                  </n-radio>
                </n-space>
              </n-radio-group>
            </n-space>
          </div>
        </div>
        <div class="w-[756px]">
          <div class="w-full flex flex-col">
            <n-space class="mb-[17px]" justify="space-between">
              <n-space vertical>
                <p class="m-0">在您选择的范围内，共有 {{ traillist.length }} 个活动</p>
                <h3 class="m-0">武汉营地推荐</h3>
              </n-space>
              <n-space vertical>
                <span>排列方式：</span>
                <n-select
                  class="w-[180px]"
                  size="large"
                  v-model:value="arrange"
                  :options="arranges"
                ></n-select>
              </n-space>
            </n-space>
            <n-space vertical>
              <div v-if="isLoading">
                <div
                  v-for="i in traillist"
                  :key="i.id"
                  @click="opentrail(i.id)"
                  class="div-container shadow-md w-full flex h-[200px] mb-[12px] rounded-[20px] overflow-hidden"
                >
                  <img class="w-[252px] h-full" :src="i.himg" alt="" />
                  <div class="w-[480px] h-[176px] p-[12px]">
                    <div class="flex flex-col">
                      <span class="m-0 p-0 text-[20px]">{{ i.name }}</span>
                      <span class="m-0">{{ i.option }}</span>
                      <n-space>
                        <span class="m-0 text-[12px]">{{ i.optype }}</span>
                      </n-space>
                    </div>
                    <div class="flex justify-between h-[90px]">
                      <div class="h-[90px] flex flex-col justify-end">
                        <p class="m-0 mb-[15px] text-[#227950]">现在预定，到点付款</p>
                        <div class="flex">
                          <p
                            class="m-0 mr-[4px] w-[33px] h-[24px] text-center rounded-[4px] bg-[#227950] text-[#fff]"
                          >
                            {{ i.scor }}
                          </p>
                          <p class="m-0">{{ scortitle(i.scor) }}</p>
                        </div>
                      </div>
                      <div class="w-[223.54px] flex flex-col justify-between items-end">
                        <div>
                          <h2 class="m-0">RMB{{ i.son }}</h2>
                          <p class="m-0 text-[12px]">总价：{{ i.son + 6 }}</p>
                          <p class="m-0 text-[12px]">包平台费</p>
                        </div>
                        <h4 class="m-0">
                          {{
                            `${formatDate(trailStore.range[0])} - ${formatDate(trailStore.range[1])}`
                          }}
                        </h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div v-if="!isLoading" class="w-full h-[600px]">
                <trailLoad></trailLoad>
              </div>
            </n-space>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script lang="ts" setup>
import { computed, ref } from 'vue'
import { getTrails } from '@/service/api/trail'
import trailLoad from '@/components/common/trailLoad.vue'
import { scortitle, formatDate } from '@/utils/index'
import { useTrailStore } from '@/stores/modules/trail'
import { useRouter } from 'vue-router'
import { useMessage } from 'naive-ui'
const message = useMessage()
const router = useRouter()
const opentrail = (id: number) => {
  // 根据id进入详情也
  router.push({ path: `/trailinfo/${id}` })
}

const trailStore = useTrailStore()
// 内容加载

const isLoading = ref<boolean>(false)
// 进入获取营地信息
let trails = ref<Trails.trails[]>([])
const gettrail = async () => {
  const { data } = await getTrails()
  if (data.status === 1) {
    message.error(data.message)
  }
  trails.value = data.data
  isLoading.value = true
  return trails
}

gettrail()

// 人数
const popuer = ref(1)

// 地点？
const options = [
  {
    label: '洪山区',
    value: '洪山区'
  },
  {
    label: '江夏区',
    value: '江夏区'
  },
  {
    label: '青山区',
    value: '青山区'
  },
  {
    label: '武昌区',
    value: '武昌区'
  },
  {
    label: '江岸区',
    value: '江岸区'
  },
  {
    label: '江汉区',
    value: '江汉区'
  },
  {
    label: '硚口区',
    value: '硚口区'
  },
  {
    label: '汉阳区',
    value: '汉阳区'
  },
  {
    label: '东西湖区',
    value: '东西湖区'
  },
  {
    label: '黄陂区',
    value: '黄陂区'
  }
]
const option = ref<string>('地区：@')
const tempOption = ref<string>('地区：@')
// 让输入框失去焦点，也就是输入完成之后再去更新option进行筛选
const updateOption = () => {
  option.value = tempOption.value
}
const opt = computed((): string => {
  return option.value.split('@', 2)[1]
})

// 价格
const son = ref<number>(0)
const songs = [
  {
    value: 0,
    label: '不限'
  },
  {
    value: 50,
    label: '0元——50元'
  },
  {
    value: 100,
    label: '50元——100元'
  },
  {
    value: 150,
    label: '100元——150元'
  },
  {
    value: '200',
    label: '150元以上'
  }
]
// 活动有无
const act = ref<number>(0)
const acts = [
  { value: 0, label: '不限' },
  { value: 1, label: '只看活动' }
]
// 评分
const scor = ref<number>(0)
const scores = [
  { value: 0, label: '不限' },
  { value: 7, label: '7+' },
  { value: 8, label: '8+' },
  { value: 9, label: '9+' }
]

// 根据评分对应描序

// 排列方式
const arrange = ref<string>('推荐')
const arranges = [
  { label: '推荐', value: '推荐' },
  { label: '价格由高到低', value: '价格由高到低' },
  { label: '价格由低到高', value: '价格由低到高' },
  { label: '评分等级', value: '评分等级' }
]

// 列表的排列和筛选
const traillist = computed(() => {
  isLoading.value = false
  let filteredTrails: Trails.trails[] = [...trails.value]
  // 根据son、act和scor进行筛选

  filteredTrails = filteredTrails.filter((trail) => {
    return (
      (opt.value === '' || trail.option.trim() == opt.value.trim()) &&
      (scor.value === 0 || trail.scor >= scor.value) &&
      (act.value === 0 || trail.act === act.value)
    )
  })
  // 根据价格son进行筛选
  if (son.value === 50) {
    filteredTrails = filteredTrails.filter((trail) => {
      return trail.son >= 0 && trail.son < 50
    })
  } else if (son.value === 100) {
    filteredTrails = filteredTrails.filter((trail) => {
      return trail.son >= 50 && trail.son < 100
    })
  } else if (son.value === 150) {
    filteredTrails = filteredTrails.filter((trail) => {
      return trail.son >= 100 && trail.son < 150
    })
  } else if (son.value > 150) {
    filteredTrails = filteredTrails.filter((trail) => {
      return trail.son >= 150
    })
  }

  // 根据arrange进行排序
  if (arrange.value === '价格由高到低') {
    filteredTrails.sort((a, b) => b.son - a.son)
  } else if (arrange.value === '价格由低到高') {
    filteredTrails.sort((a, b) => a.son - b.son)
  } else if (arrange.value === '评分等级') {
    filteredTrails.sort((a, b) => b.scor - a.scor)
  }
  isLoading.value = true
  return filteredTrails
})
</script>
<style lang="scss" scoped>
.bodermap {
  border: 1px solid #ccc;
  overflow: hidden;
  height: 143px;
}
.borderp {
  border-top: 1px solid #ccc;
}
.bordershop {
  border: 1px solid rgb(231, 231, 231);
}
.div-container:hover {
  cursor: pointer;
}
</style>
