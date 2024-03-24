<template>
  <header
    class="flex justify-center border-0 border-b border-[#ccc] border-solid box-shadow-sm h-[72px] w-full"
  >
    <div class="h-full w-[1260px] flex items-center transition-all-300">
      <div class="w-[220px] min-w-[155px] h-full">
        <a href="/" class="w-full h-full flex justify-center items-center">
          <div class="w-[32px] h-[32px] bg-cover bg-[url('@/assets/images/logo.svg')]"></div>
          <h2 class="w-[115.5px] m-0 ml-[8px] text-[16px] text-[#3FB074]">
            武汉露营系统&nbsp;&nbsp;&nbsp;&nbsp;
          </h2></a
        >
      </div>
      <div class="w-[668.8px] h-full px-[20px] flex justify-center items-center">
        <n-menu v-model:value="activeKey" mode="horizontal" :options="menuOptions" responsive />
      </div>
      <div class="h-full w-[339px] min-w-[155px] flex justify-center items-center">
        <!-- 灯  -->
        <n-tooltip placement="bottom" trigger="hover">
          <template #trigger>
            <darkModesSwitch class="z-10 px-[16px]" />
          </template>
          <span> 主题模式 </span>
        </n-tooltip>

        <n-tooltip placement="bottom" trigger="hover">
          <template #trigger>
            <n-button quaternary class="px-[16px]">
              <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24">
                <path
                  fill="currentColor"
                  d="M12 2A10 10 0 0 0 2 12c0 4.42 2.87 8.17 6.84 9.5c.5.08.66-.23.66-.5v-1.69c-2.77.6-3.36-1.34-3.36-1.34c-.46-1.16-1.11-1.47-1.11-1.47c-.91-.62.07-.6.07-.6c1 .07 1.53 1.03 1.53 1.03c.87 1.52 2.34 1.07 2.91.83c.09-.65.35-1.09.63-1.34c-2.22-.25-4.55-1.11-4.55-4.92c0-1.11.38-2 1.03-2.71c-.1-.25-.45-1.29.1-2.64c0 0 .84-.27 2.75 1.02c.79-.22 1.65-.33 2.5-.33c.85 0 1.71.11 2.5.33c1.91-1.29 2.75-1.02 2.75-1.02c.55 1.35.2 2.39.1 2.64c.65.71 1.03 1.6 1.03 2.71c0 3.82-2.34 4.66-4.57 4.91c.36.31.69.92.69 1.85V21c0 .27.16.59.67.5C19.14 20.16 22 16.42 22 12A10 10 0 0 0 12 2"
                />
              </svg>
            </n-button>
          </template>
          <span> github </span>
        </n-tooltip>

        <n-button quaternary class="px-[16px]" @click="$router.push('/creator')"
          >发布你的动态</n-button
        >

        <n-popover
          trigger="click"
          style="
            padding: 0;
            width: 410px;
            height: 350px;
            border: 1px #ccc solid;
            border-radius: 30px;
          "
        >
          <template #trigger>
            <n-button
              v-if="!user.token"
              type="primary"
              class="mx-[16px]"
              @click="$router.push('/login')"
            >
              未登录
            </n-button>

            <n-avatar class="mx-[16px]" v-else round size="medium" :src="user.user.img" />
          </template>
          <n-space vertical>
            <div class="h-full flex flex-col items-center content-between">
              <p class="my-[18px]">{{ user.user.phone }}</p>
              <n-avatar round :size="98" :src="user.user.img"></n-avatar>
              <p class="m-0 text-[24px]">{{ user.user.name }}，你好</p>
              <n-button round class="h-[40px] w-[150px]" @click="$router.push('/user/likes')"
                >查看你的喜欢</n-button
              >
              <div class="mt-[10px] w-[302px] flex justify-between">
                <n-button
                  @click="$router.push('/user')"
                  secondary
                  class="lecusbutton w-[150px] h-[52px]"
                >
                  <template #icon>
                    <n-icon size="28"><PersonCircleOutline /></n-icon>
                  </template>
                  个人中心
                </n-button>
                <n-button @click="logout" secondary class="recusbutton w-[150px] h-[52px]">
                  <template #icon>
                    <n-icon size="28"><ExitOutline /></n-icon>
                  </template>
                  退出登录
                </n-button>
              </div>
              <p class="text-[12px]">隐私权注册 - 服务条款</p>
            </div>
          </n-space>
        </n-popover>
      </div>
    </div>
  </header>

  <main>
    <transition name="slide" mode="out-in">
      <router-view v-slot="{ Component, route }">
        <keep-alive>
          <component :is="Component" :key="route.fullPath" />
        </keep-alive> </router-view
    ></transition>
  </main>

  <footer class="w-full h-[404.4px] mt-[32px] border-0 border-t border-solid border-[#ccc]">
    <div class="w-[1100px] h-[404.4px] m-auto flex justify-center items-center">
      <div class="w-[219px] mr-[50px]">
        <div
          class="h-[67.6px] border-0 border-b border-dashed border-[#000] text-[12px] font-bold mb-[10px]"
        >
          500 Terry Francine Street <br />
          San Francisco, CA 94158 <br />
          info@mysite.com
        </div>

        <div class="text-[12px] font-bold">
          © 2035 by YOLO.
          <br />
          Powered and secured by Wix
        </div>
      </div>

      <div class="w-[300px] mr-[50px]">
        <div
          class="bg-[#ccc] border border-slate-200 grid grid-cols-6 gap-2 rounded-xl p-2 text-sm"
        >
          <h1 class="text-center text-200 text-xl font-bold col-span-6">发送反馈</h1>
          <textarea
            placeholder="Your feedback..."
            class="bg-slate-100 text-slate-600 h-28 placeholder:text-slate-600 placeholder:opacity-50 border border-slate-200 col-span-6 resize-none outline-none rounded-lg p-2 duration-300 focus:border-slate-600"
          ></textarea>
          <button
            class="fill-slate-600 col-span-1 flex justify-center items-center rounded-lg p-2 duration-300 bg-slate-100 hover:border-slate-600 focus:fill-blue-200 focus:bg-blue-400 border border-slate-200"
          >
            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 0 512 512">
              <path
                d="M464 256A208 208 0 1 0 48 256a208 208 0 1 0 416 0zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm177.6 62.1C192.8 334.5 218.8 352 256 352s63.2-17.5 78.4-33.9c9-9.7 24.2-10.4 33.9-1.4s10.4 24.2 1.4 33.9c-22 23.8-60 49.4-113.6 49.4s-91.7-25.5-113.6-49.4c-9-9.7-8.4-24.9 1.4-33.9s24.9-8.4 33.9 1.4zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"
              ></path>
            </svg>
          </button>
          <button
            class="fill-slate-600 col-span-1 flex justify-center items-center rounded-lg p-2 duration-300 bg-slate-100 hover:border-slate-600 focus:fill-blue-200 focus:bg-blue-400 border border-slate-200"
          >
            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 0 512 512">
              <path
                d="M464 256A208 208 0 1 0 48 256a208 208 0 1 0 416 0zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM174.6 384.1c-4.5 12.5-18.2 18.9-30.7 14.4s-18.9-18.2-14.4-30.7C146.9 319.4 198.9 288 256 288s109.1 31.4 126.6 79.9c4.5 12.5-2 26.2-14.4 30.7s-26.2-2-30.7-14.4C328.2 358.5 297.2 336 256 336s-72.2 22.5-81.4 48.1zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"
              ></path>
            </svg>
          </button>
          <span class="col-span-2"></span>
          <button
            class="bg-slate-100 stroke-slate-600 border border-slate-200 col-span-2 flex justify-center rounded-lg p-2 duration-300 hover:border-slate-600 hover:text-white focus:stroke-blue-200 focus:bg-blue-400"
          >
            <svg
              fill="none"
              viewBox="0 0 24 24"
              height="30px"
              width="30px"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                stroke-linejoin="round"
                stroke-linecap="round"
                stroke-width="1.5"
                d="M7.39999 6.32003L15.89 3.49003C19.7 2.22003 21.77 4.30003 20.51 8.11003L17.68 16.6C15.78 22.31 12.66 22.31 10.76 16.6L9.91999 14.08L7.39999 13.24C1.68999 11.34 1.68999 8.23003 7.39999 6.32003Z"
              ></path>
              <path
                stroke-linejoin="round"
                stroke-linecap="round"
                stroke-width="1.5"
                d="M10.11 13.6501L13.69 10.0601"
              ></path>
            </svg>
          </button>
        </div>
      </div>

      <div>
        <div
          class="w-[220px] h-[60px] flex justify-between border-0 border-b border-dashed mb-[10px] border-[#000]"
        >
          <img
            class="w-[50px] h-[50px]"
            src="https://static.wixstatic.com/media/0b3d2050d0e14e65afe8f146c2c77589.png/v1/fill/w_63,h_63,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/0b3d2050d0e14e65afe8f146c2c77589.png"
            alt=""
          />
          <img
            class="w-[50px] h-[50px]"
            src="https://static.wixstatic.com/media/f11086d62b2f4ce49726a762202b47bb.png/v1/fill/w_63,h_63,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/f11086d62b2f4ce49726a762202b47bb.png"
            alt=""
          />
          <img
            class="w-[50px] h-[50px]"
            src="https://static.wixstatic.com/media/66f611a8e2f5460eb509ea8c5ab93b6d.png/v1/fill/w_63,h_63,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/66f611a8e2f5460eb509ea8c5ab93b6d.png"
            alt=""
          />
        </div>
        <div class="w-[220px] h-full">
          <a href="/" class="w-full h-full flex justify-center items-center">
            <div class="w-[32px] h-[32px] bg-cover bg-[url('@/assets/images/logo.svg')]"></div>
            <h2 class="w-[115.5px] m-0 ml-[8px] text-[16px] text-[#3FB074]">
              武汉露营系统&nbsp;&nbsp;&nbsp;&nbsp;
            </h2></a
          >
        </div>
      </div>
    </div>
  </footer>
</template>

<script lang="ts" setup>
import { NIcon, type MenuOption } from 'naive-ui'
import { ref, type Component, h } from 'vue'
import {
  ApertureOutline as aperture,
  MapOutline as map,
  HomeOutline as home,
  TrailSignOutline as trail
} from '@vicons/ionicons5'
import darkModesSwitch from '@/components/common/dark-mode-switch.vue'
import { RouterLink } from 'vue-router'
import { useUser } from '@/stores/modules/auth'
import { PersonCircleOutline, ExitOutline } from '@vicons/ionicons5'
import { useRouter } from 'vue-router'
import { useMessage } from 'naive-ui'
const message = useMessage()
const router = useRouter()
const user = useUser()

const activeKey = ref<string | null>('home')

// 瑞出登录
const logout = () => {
  user.loginout()
  message.success('退出成功')
  localStorage.clear()
  router.push({ path: '/login' })
}

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
            path: '/'
          }
        },
        '首页'
      ),
    key: 'home',
    icon: renderIcon(home)
  },
  {
    label: () =>
      h(
        RouterLink,
        {
          to: {
            path: '/trail'
          }
        },
        { default: () => '营地' }
      ),
    key: 'trail',
    icon: renderIcon(trail)
  },
  {
    label: () =>
      h(
        RouterLink,
        {
          to: {
            path: '/map'
          }
        },
        { default: () => '地图' }
      ),

    key: 'map',
    icon: renderIcon(map)
  },
  {
    label: () =>
      h(
        RouterLink,
        {
          to: {
            path: '/aperture'
          }
        },
        { default: () => '动态' }
      ),

    key: 'aperture',
    icon: renderIcon(aperture)
  }
]
</script>

<style lang="scss" scoped>
.lecusbutton {
  border-radius: 26px 0 0 26px;
}
.recusbutton {
  border-radius: 0px 26px 26px 0px;
}
.n-divider:not(.n-divider--vertical) {
  margin: 0;
}
.slide-enter-active,
.slide-leave-active {
  transition: transform 0.9s;
}
.slide-enter-from {
  transform: translateX(100%);
}
.slide-leave-to {
  transform: translateX(-100%);
}
</style>
