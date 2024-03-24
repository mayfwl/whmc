<!-- 实现瀑布流 -->
<template>
  <div class="fs-waterfall-container" v-loading="state.loading">
    <v-loading>
      <div class="fs-waterfall-content" ref="contentRef">
        <div class="fs-waterfall-list">
          <div
            class="fs-waterfall-item"
            v-for="(item, index) in state.imageList"
            :key="item.id"
            :style="{
              width: `${state.imageWidth}px`,
              transform: `translate3d(${imagePos[index].x}px, ${imagePos[index].y}px, 0)`
            }"
          >
            <slot name="item" :item="item"></slot>
          </div>
        </div>
      </div>
    </v-loading>
  </div>
</template>
<script setup lang="ts">
import type { IwaterfallProps, IImageItem } from '@/typings/waterfall'
import { computed, onMounted, reactive, ref } from 'vue'

defineSlots<{ item(props: { item: IImageItem }): any }>()

const props = defineProps<IwaterfallProps>()

const contentRef = ref<HTMLDivElement>() //容器宽度,根据容器宽度计算

const columnHeight = ref<number[]>([])

const state = reactive({
  loading: false, //v-loading在加载数据时显示加载指示器，并在数据加载完成后显示实际内容
  isfinish: false, //数据是否加载完成
  imageWidth: 0, //每个图片的宽度
  page: 1,
  imageList: [] as IImageItem[] //图片列表
})

// 每张图片的具体位置
const imagePos = ref<
  {
    x: number
    y: number
  }[]
>([])

// 获取最小烈位置和高度
const min = computed(() => {
  let minIndex = -1,
    minHight = Infinity
  for (let i = 0; i < columnHeight.value.length; i++) {
    const h = columnHeight.value[i]
    if (h < minHight) {
      minIndex = i
      minHight = h
    }
  }
  return {
    minIndex, //获取最小高度位置
    minHight //最小高度
  }
})

// 获取数据
const getImageList = async (page: number, pageSize: number) => {
  if (state.isfinish) return //如果数据已经加载完成就不再加载
  state.loading = true
  state.page++
  const list = await props.request(page, pageSize)
  console.log(list)

  if (!list.length) {
    //list为空表示数据已经加载完成
    state.isfinish = true
    return
  }
  computedImagePos(list)
  state.imageList = [...state.imageList, ...list]
}

// 图片摆放位置
const computedImagePos = (list: IImageItem[]) => {
  // 遍历图片列表
  list.forEach((item, index) => {
    //   获取等比例缩放的图片高度
    const imageHeight = Math.floor((item.height * state.imageWidth) / item.width)
    console.log(imageHeight)

    // 先判断是不是第一行，第一行的图片放在最上面高度为0
    if (index < props.column) {
      imagePos.value.push({
        x:
          index % props.column !== 0
            ? index * state.imageWidth + props.gap * index
            : index * state.imageWidth,
        y: 0
      })
      console.log(imagePos.value)

      columnHeight.value.push(imageHeight + props.gap)
    } else {
      const { minIndex, minHight } = min.value
      imagePos.value.push({
        x:
          minIndex % props.column !== 0
            ? minIndex * state.imageWidth + props.gap * minIndex
            : minIndex * state.imageWidth,
        y: minHight
      })
      console.log(imagePos.value)

      columnHeight.value[minIndex] += imageHeight + props.gap
    }
  })
}

// 初始化
const init = () => {
  if (contentRef.value) {
    // 计算每一个图片宽度
    state.imageWidth =
      (contentRef.value.offsetWidth - (props.column - 1) * props.gap) / props.column
    console.log(state.imageWidth)

    getImageList(state.page, props.pageSize)
  }
}

onMounted(() => {
  init()
})
</script>
<style lang="scss">
.fs-waterfall {
  &-container {
    width: 100%;
    height: 100%;
  }
  &-content {
    width: 100%;
    height: 100%;
    overflow: scroll;
  }
  &-list {
    width: 100%;
    position: relative;
  }
  &-item {
    position: absolute;
    top: 0;
    left: 0;
    box-sizing: border-box; //元素的宽度和高度包括元素的内容、内边距和边框，但不包括元素的外边距
  }
}
</style>
