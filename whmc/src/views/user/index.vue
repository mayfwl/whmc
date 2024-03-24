<template>
  <div>
    <!-- 简介 -->
    <div class="w-[1100px] m-auto flex flex-col">
      <div class="relative w-[1100px] h-[145px] m-auto pt-[20px] flex items-center">
        <div class="w-[112px] h-[112px] rounded-[56px] bg-black">
          <img :src="user.user.img" class="w-full h-full rounded-[56px]" alt="" />
        </div>
        <div class="h-[120px] w-[672px] ml-[40px]">
          <ul class="h-full flex-wrap flex flex-col justify-between">
            <li class="h-[28px] text-[20px]">{{ user.user.name }}</li>
            <li class="h-[24px] flex user text-[14px] text-[#a9a9a9]">
              <p class="m-0">
                作品：<span class="text-[#161823]">{{ userworks }}</span>
              </p>
              <p class="m-0 ml-[9px]">
                喜欢：<span class="text-[#161823]">{{ userlike }}</span>
              </p>
              <p class="m-0 ml-[9px]">
                预约：<span class="text-[#161823]">{{ userorder }}</span>
              </p>
            </li>
            <li class="h-[20px] text-[12px] text-[#a9a9a9]">账号：{{ user.user.phone }}</li>
            <li class="h-[20px] text-[12px]">简介：{{ user.user.title }}</li>
          </ul>
        </div>
        <n-button @click="showModal = true" class="absolute bottom-1 right-1">编辑资料</n-button>
      </div>
      <!-- 喜欢，预约，作品 -->
      <div class="w-full mb-[30px] mt-[12px] bordertop">
        <div class="w-[668.8px] h-[48px] flex justify-center items-center">
          <n-menu
            v-model:value="Post.activeKey"
            @click="Post.activeKey = $route.path.split('/')[2]"
            mode="horizontal"
            :options="menuOptions"
            responsive
          />
        </div>

        <router-view />
      </div>
    </div>

    <!-- 模态框 -->
    <n-modal
      title="编辑资料"
      size="huge"
      v-model:show="showModal"
      :mask-closable="false"
      preset="card"
      class="w-[480px] h-[588px] rounded-[20px] relative"
    >
      <div class="flex flex-col justify-between h-[378px]">
        <div class="flex flex-col items-center" @click="edithuan = !edithuan">
          <img class="w-[108px] h-[108px] rounded-[54px]" :src="user.user.img" alt="" />
          <p class="text-[#a9a9a9] text-[12px]">点击切换图片</p>
        </div>
        <div
          v-if="edithuan"
          class="borderss absolute bg-white rounded-[20px] z-10 w-[200px] h-[250.4px] right-0"
        >
          <p>请选择图像</p>
          <ul class="w-[200px] h-[200px] m-0 p-0 list-none flex flex-wrap justify-between">
            <li v-for="item in 9">
              <img
                @click="a(item)"
                class="w-[60px] h-[60px] rounded-[10px]"
                :src="`https://api.multiavatar.com/${item}.png`"
                alt=""
              />
            </li>
          </ul>
        </div>
        <div>
          <p class="m-0 mb-[2px] text-[14px]">名字</p>
          <n-input maxlength="10" show-count clearable v-model:value="user.user.name" />
        </div>
        <div>
          <p class="m-0 mb-[2px] text-[14px]">简介</p>
          <n-input type="textarea" maxlength="30" show-count v-model:value="user.user.title" />
        </div>
      </div>
      <template #footer>
        <n-button class="mr-[20px]" type="primary" @click="edit"> 保存 </n-button>
        <n-button strong secondary @click="showModal = false"> 取消 </n-button>
      </template>
    </n-modal>
  </div>
</template>
<script lang="ts" setup>
import { RouterView } from 'vue-router'
import { NIcon, type MenuOption } from 'naive-ui'
import { ref, type Component, h } from 'vue'
import { RouterLink } from 'vue-router'
import {
  HeartCircle as likes,
  PizzaOutline as makes,
  GitNetworkSharp as works,
  TimeOutline as makeshistory
} from '@vicons/ionicons5'

import { useUser } from '@/stores/modules/auth'
import { getlikenum, getpostnum, getordernum, getedit } from '@/service/api/userinfo'
import { usePost } from '@/stores/modules/posts'
const Post = usePost()
const user = useUser()
const edithuan = ref(false)
const a = (item: number) => {
  user.user.img = `https://api.multiavatar.com/${item}.png`
  edithuan.value = !edithuan.value
}
// 作品数量
const userworks = ref<number>(0)
const worknum = async () => {
  const {
    data: { data }
  } = await getpostnum()
  userworks.value = data[0].count
}
worknum()
//x喜欢数量
const userlike = ref<number>(0)
const likenum = async () => {
  const {
    data: { data }
  } = await getlikenum()
  userlike.value = data[0].count
}
likenum()
// 预约数量
const userorder = ref<number>(0)
const ordernum = async () => {
  const {
    data: { data }
  } = await getordernum()
  userorder.value = data[0].count
}
ordernum()
const showModal = ref<boolean>(false)

const edit = async () => {
  getedit({ name: user.user.name, title: user.user.title, img: user.user.img })
  showModal.value = false
}
// 导航喜欢/预约等
// 默认

function renderIcon(icon: Component) {
  return () => h(NIcon, null, { default: () => h(icon) })
}

// 导航
const menuOptions: MenuOption[] = [
  {
    label: () =>
      h(
        RouterLink,
        {
          to: {
            path: '/user/likes'
          }
        },
        '喜欢'
      ),
    key: 'likes',
    style: { fontSize: '18px' },
    icon: renderIcon(likes)
  },
  {
    label: () =>
      h(
        RouterLink,
        {
          to: {
            path: '/user/makes'
          }
        },
        '预约'
      ),
    key: 'makes',
    style: { fontSize: '18px' },
    icon: renderIcon(makes)
  },
  {
    label: () =>
      h(
        RouterLink,
        {
          to: {
            path: '/user/works'
          }
        },
        '作品'
      ),
    key: 'works',
    icon: renderIcon(works)
  },
  {
    label: () =>
      h(
        RouterLink,
        {
          to: {
            path: '/user/makeshistory'
          }
        },
        '预约历史'
      ),
    key: 'makeshistory',
    icon: renderIcon(makeshistory)
  }
]
</script>
<style lang="scss">
.bordertop {
  border-top: 1px solid #ccc;
  .n-menu-item-content-header {
    a {
      font-size: 18px;
    }
  }
}
//校提示
.tooltip {
  position: absolute;
  right: 3px;
  display: inline-block;
  cursor: pointer;
  font-family: 'Arial', sans-serif;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}

.tooltiptext {
  visibility: hidden;
  width: 200px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 5px;
  padding: 10px;
  position: absolute;
  z-index: 1;
  top: 125%;
  right: 0;

  opacity: 0;
  transition: opacity 0.3s;
}

.tooltiptext::after {
  content: '';
  position: absolute;
  top: -10px;
  left: 50%;
  margin-left: -10px;
  border-width: 10px;
  border-style: solid;
  border-color: transparent transparent #333 transparent;
}

.tooltip .icon {
  display: inline-block;
  width: 20px;
  height: 20px;
  background-color: #4caf50;
  color: #fff;
  border-radius: 50%;
  text-align: center;
  line-height: 20px;
}

.borderss {
  border: 1px solid #ccc;
}
</style>
