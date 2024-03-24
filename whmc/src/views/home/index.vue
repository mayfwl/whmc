<template>
  <!-- 内容 -->
  <main>
    <div class="w-[89%] h-[600px] m-auto">
      <div class="h-full w-full relative top-0">
        <video
          autoplay
          crossorigin="anonymous"
          preload="auto"
          muted
          loop
          playsinline
          class="h-full w-full object-cover object-center opacity-100 absolute top-0"
        >
          <source
            src="https://video.wixstatic.com/video/4da84e_b4ca60828d674e1cb90d49b2aeb64074/1080p/mp4/file.mp4"
            type="video/mp4"
          />
        </video>
        <div class="h-full w-full bg-black bg-opacity-30 absolute top-0">
          <h1 class="text-[74px] leading-tight text-[#fff] absolute top-[130px] left-[150px]">
            开始你的 <br />
            下一次露营冒险
          </h1>
          <p class="text-[#fff] absolute top-[380px] left-[150px] font-bold">
            I'm a paragraph. Click here to add your own text and edit me.
          </p>
          <n-button
            class="w-[140px] h-[50px] btn btn-white-outline font-bold absolute left-[150px] top-[450px]"
            ><span class="font-bold">预约营地</span></n-button
          >
        </div>
      </div>
    </div>

    <div class="w-[1100px] m-auto mt-[50px] mb-[35px]">
      <h1 class="mb-[0px]">最新活动</h1>
      <p class="mt-[0px] text-[16px]">专属特惠活动</p>
      <div class="w-full flex justify-between object-cover">
        <div
          class="w-[542px] h-[184px] flex justify-between border border-solid border-[#ccc] rounded-[20px] shadow-xl"
        >
          <div class="w-[262px] h-[152px] p-[20px]">
            <h3 class="m-0">开启你的假期</h3>
            <p class="text-[16px]">浏览提供热门选择的营地。</p>
            <n-button type="primary" class="rounded-[10px]">查看营地</n-button>
          </div>
          <div class="w-[180px] h-full rounded-[20px]">
            <img
              class="w-full h-full rounded-r-[20px]"
              src="https://r-xx.bstatic.com/xdata/images/xphoto/500x500/220031205.jpeg?k=bf9841e8ba89dfdf92e02d45e45dc89fcca2d981b7c74ad57d3ecf6ba64ba1c2&o="
              alt=""
            />
          </div>
        </div>

        <div
          class="w-[542px] h-[184px] flex justify-between border border-solid border-[#ccc] rounded-[20px] shadow-xl bg-[url('https://q-xx.bstatic.com/xdata/images/xphoto/714x300/293799350.jpeg?k=8a6f4e24c37096fbdcd3c3d30c9f3dcea15ce35751448466decf791918012a64&o=')] bg-cover"
        >
          <div class="w-[262px] h-[152px] p-[20px]">
            <h3 class="m-0 text-white">新年新旅程</h3>
            <p class="text-[16px] text-white">2024年4月1日（含）前预订并参与，优惠10%</p>
            <n-button type="primary" class="rounded-[10px]">寻找2024年初特惠</n-button>
          </div>
        </div>
      </div>
    </div>

    <div
      class="relative overflow-hidden w-[1100px] m-auto mb-[24px] h-[253.475px] flex justify-end border border-solid border-[#ccc]"
    >
      <div
        class="w-[64px] h-[64px] rounded-[32px] absolute left-[-20px] bottom-[40px] bg-[#FFB700]"
      ></div>
      <div
        class="w-[400px] h-[453px] pl-[109.838px] flex items-center my-[-100px] rounded-[226px] bg-[#006CE4]"
      >
        <div class="w-[280px] h-[64px]">
          <h2 class="text-white m-0">为露营寻找</h2>
          <div class="h-[33.6px] overflow-hidden">
            <ul class="list-none p-0 m-0 overflow-hidden animate-[texttop_8s_ease_infinite]">
              <li>
                <h2 class="text-white m-0 underline decoration-solid decoration-[#FFC227]">营地</h2>
              </li>
              <li>
                <h2 class="text-white m-0 underline decoration-solid decoration-[#FFC227]">活动</h2>
              </li>
              <li>
                <h2 class="text-white m-0 underline decoration-solid decoration-[#FFC227]">动态</h2>
              </li>
              <li>
                <h2 class="text-white m-0 underline decoration-solid decoration-[#FFC227]">营地</h2>
              </li>
            </ul>
          </div>
          <n-button type="primary" class="w-[280px] h-[36px] mt-[16px] text-[#000] bg-white"
            >寻找营地地点</n-button
          >
        </div>
      </div>
      <div
        class="w-[392px] h-[253px] pl-[32px] mr-[32px] bg-[url('https://ac-a.static.booking.cn/psb/capla/static/media/bh_aw_cpg_main_image.b4347622.png')] bg-cover"
      ></div>
    </div>

    <div class="w-[1100px] m-auto relative">
      <h1 class="mb-[0px]">热门推荐</h1>
      <p class="m-[0px] text-[16px] mb-[16px]">无论是沙滩、草原、河边，我们的选择应有尽有</p>
      <div class="w-full h-[326.4px] m-auto relative overflow-hidden">
        <ul
          :style="{
            transform: `translateX(-${hotIndex * 280.6}px)`,
            transition: 'transform 0.5s ease-in-out'
          }"
          class="m-0 p-0 list-none flex h-[326.4px] flex-start"
        >
          <li
            v-for="hot in hotromeitem"
            :key="hot.id"
            class="mr-[16px] w-[263px] rounded-[10px] h-[324.4px] shadow-md"
          >
            <img class="w-full h-[210.4px] rounded-t-[10px] object-cover" :src="hot.img" alt="" />
            <div class="w-[247px] h-[98px] p-[8px] pt-0">
              <div>
                <h4 class="m-0">{{ hot.name }}</h4>
                <p class="text-[#474747] m-0 mb-[5px]">{{ hot.position }}</p>
              </div>
              <div class="flex justify-start">
                <div
                  class="text-[12px] text-[#fff] bg-[#3FB074] w-[16px] h-[16px] rounded-[2px] p-[4px]"
                >
                  {{ hot.grade }}
                </div>
                <span class="text-[11px]">
                  <span>{{ hot.grade < 9.0 ? '良好' : hot.grade < 9.5 ? '优秀' : '太棒了' }}</span
                  >-{{ hot.comment }}条旅客评论</span
                >
              </div>
            </div>
          </li>
        </ul>
      </div>
      <div
        v-show="hotIndex > 0"
        @click="hotIndex--"
        class="wrapper m-0 p-0 absolute top-[173.8px] left-[-20px]"
      >
        <div class="icon black">
          <span class="tooltip">Left</span>
          <span
            ><svg
              viewBox="0 0 16 16"
              class="bi bi-chevron-double-left"
              fill="currentColor"
              height="16"
              width="16"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"
                fill-rule="evenodd"
              ></path>
              <path
                d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"
                fill-rule="evenodd"
              ></path>
            </svg>
          </span>
        </div>
      </div>
      <div
        v-show="hotIndex < hotromeitem.length - 4"
        @click="hotIndex++"
        class="wrapper m-0 p-0 absolute top-[173.8px] right-[-20px]"
      >
        <div class="icon black">
          <span class="tooltip">Right</span>
          <span
            ><svg
              viewBox="0 0 16 16"
              class="bi bi-chevron-double-right"
              fill="currentColor"
              height="16"
              width="16"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"
                fill-rule="evenodd"
              ></path>
              <path
                d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"
                fill-rule="evenodd"
              ></path>
            </svg>
          </span>
        </div>
      </div>
    </div>

    <div class="w-[1100px] m-auto relative">
      <h1 class="mb-[16px]">精彩下一站，灵感这里找</h1>
      <div class="w-[1100px] h-[382px] m-auto relative overflow-hidden">
        <ul
          :style="{
            transform: `translateX(-${tactivityIndex * 558}px)`,
            transition: 'transform 0.5s ease-in-out'
          }"
          class="w-[1900px] h-[382px] flex flex-start"
        >
          <li class="relative overflow-hidden rounded-[10px] w-[542px] h-[367px]">
            <div
              class="bg-scale-110 rounded-[10px] w-[542px] h-[367px] mb-[16px] bg-cover bg-[url('https://ac-a.static.booking.cn/xdata/images/xphoto/540x405/288300879.webp?k=20a291605b4d1cc6c15b1ee3f9598c22ddb81a8d5ed73135330e426f8d2b9629&o=')]"
            ></div>
            <div class="absolute left-[10px] bottom-[15px]">
              <h2 class="m-0 text-white">武汉超赞露营小镇</h2>
              <span class="m-0 text-white text-[14px]">前往迷人的露营小镇</span>
            </div>
          </li>
          <li v-for="active in tactivity" class="w-[263px] h-[382px] ml-[16px]">
            <img :src="active.img" class="rounded-[10px] w-full h-[240px] mb-[16px]" alt="" />
            <div class="w-full h-[64px]">
              <h3 class="m-0">{{ active.name }}</h3>
              <span>{{ active.synopsis }}</span>
            </div>
          </li>
        </ul>
      </div>
      <div
        v-show="tactivityIndex >= 1"
        @click="tactivityIndex--"
        class="wrapper m-0 p-0 absolute top-[173.8px] left-[-20px]"
      >
        <div class="icon black">
          <span class="tooltip">Left</span>
          <span
            ><svg
              viewBox="0 0 16 16"
              class="bi bi-chevron-double-left"
              fill="currentColor"
              height="16"
              width="16"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"
                fill-rule="evenodd"
              ></path>
              <path
                d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"
                fill-rule="evenodd"
              ></path>
            </svg>
          </span>
        </div>
      </div>
      <div
        v-show="tactivityIndex < 1"
        @click="tactivityIndex++"
        class="wrapper m-0 p-0 absolute top-[173.8px] right-[-20px]"
      >
        <div class="icon black">
          <span class="tooltip">Right</span>
          <span
            ><svg
              viewBox="0 0 16 16"
              class="bi bi-chevron-double-right"
              fill="currentColor"
              height="16"
              width="16"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"
                fill-rule="evenodd"
              ></path>
              <path
                d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"
                fill-rule="evenodd"
              ></path>
            </svg>
          </span>
        </div>
      </div>
    </div>
  </main>
</template>

<script lang="ts" setup>
import { ref } from 'vue'

// 热门推荐
type hotRomeItem = {
  id: number
  name: string
  position: string
  img: string
  grade: number
  comment: number
}

const hotromeitem: hotRomeItem[] = [
  {
    id: 1,
    name: 'Casa na praia em São Sebastião',
    position: '武汉，洪山区',
    img: 'https://ac-a.static.booking.cn/xdata/images/hotel/square600/255854447.webp?k=f9c9d47f18b3156fdcc5596749d137f35e3cf4962a8d3d37d69be0066ec9bfc3&o=',
    grade: 9.2,
    comment: 123
  },
  {
    id: 2,
    name: 'Casa na praia em São Sebastião',
    position: '武汉，洪山区',
    img: 'https://ac-a.static.booking.cn/xdata/images/hotel/square600/228714298.webp?k=2e88556aac50ed7e31bdc4f399c385b1c2b3208d8a3c3fc622e770bc6d9b0c98&o=',
    grade: 9.2,
    comment: 123
  },
  {
    id: 3,
    name: 'Casa na praia em São Sebastião',
    position: '武汉，洪山区',
    img: 'https://ac-a.static.booking.cn/xdata/images/hotel/square600/255854447.webp?k=f9c9d47f18b3156fdcc5596749d137f35e3cf4962a8d3d37d69be0066ec9bfc3&o=',
    grade: 8.2,
    comment: 123
  },
  {
    id: 4,
    name: 'Casa na praia em São Sebastião',
    position: '武汉，洪山区',
    img: 'https://ac-a.static.booking.cn/xdata/images/hotel/square600/366855457.webp?k=ef25b0c640c7c2f4fcac4c79509ef1dbb484c19f21a7c8cba18d9270d7f790e9&o=',
    grade: 9.8,
    comment: 123
  },
  {
    id: 5,
    name: 'Casa na praia em São Sebastião',
    position: '武汉，洪山区',
    img: 'https://ac-a.static.booking.cn/xdata/images/hotel/square600/255854447.webp?k=f9c9d47f18b3156fdcc5596749d137f35e3cf4962a8d3d37d69be0066ec9bfc3&o=',
    grade: 9.7,
    comment: 123
  },
  {
    id: 6,
    name: 'Casa na praia em São Sebastião',
    position: '武汉，洪山区',
    img: 'https://ac-a.static.booking.cn/xdata/images/hotel/square600/164383742.webp?k=61074259c477f7211cbd42a6542dcc3b1b1a049e332ba349d836b663df33d511&o=',
    grade: 9.2,
    comment: 123
  },
  {
    id: 7,
    name: 'Casa na praia em São Sebastião',
    position: '武汉，洪山区',
    img: 'https://ac-a.static.booking.cn/psb/capla/static/media/bh_aw_cpg_main_image.b4347622.png',
    grade: 9.2,
    comment: 123
  },
  {
    id: 8,
    name: 'Casa na praia em São Sebastião',
    position: '武汉，洪山区',
    img: 'https://ac-a.static.booking.cn/psb/capla/static/media/bh_aw_cpg_main_image.b4347622.png',
    grade: 9.5,
    comment: 123
  }
]
const hotIndex = ref<number>(0)

// 精彩灵感活动
type TActivity = {
  id: number
  name: string
  img: string
  position: string
  people: number
  synopsis: string
  time: string
  price: number
}
const tactivity: TActivity[] = [
  {
    id: 1,
    name: '武汉东湖令人惊奇的夜景',
    img: 'https://ac-a.static.booking.cn/xdata/images/xphoto/540x405/241122612.webp?k=6787b38d39720e070a5603360bdebb5b36e09c55c647bd2da7acc011537a37bd&o=',
    position: '武汉，洪山区',
    people: 123,
    synopsis: '领略超赞的夜景，美食',
    time: '2024-10-12',
    price: 500
  },
  {
    id: 2,
    name: '武汉东湖令人惊奇的夜景',
    img: 'https://ac-a.static.booking.cn/xdata/images/xphoto/540x405/241122612.webp?k=6787b38d39720e070a5603360bdebb5b36e09c55c647bd2da7acc011537a37bd&o=',
    position: '武汉，洪山区',
    people: 123,
    synopsis: '领略超赞的夜景，美食',
    time: '2024-10-12',
    price: 500
  },
  {
    id: 3,
    name: '武汉东湖令人惊奇的夜景',
    img: 'https://ac-a.static.booking.cn/xdata/images/xphoto/540x405/241122612.webp?k=6787b38d39720e070a5603360bdebb5b36e09c55c647bd2da7acc011537a37bd&o=',
    position: '武汉，洪山区',
    people: 123,
    synopsis: '领略超赞的夜景，美食',
    time: '2024-10-12',
    price: 500
  },
  {
    id: 4,
    name: '武汉东湖令人惊奇的夜景',
    img: 'https://ac-a.static.booking.cn/xdata/images/xphoto/540x405/241122612.webp?k=6787b38d39720e070a5603360bdebb5b36e09c55c647bd2da7acc011537a37bd&o=',
    position: '武汉，洪山区',
    people: 123,
    synopsis: '领略超赞的夜景，美食',
    time: '2024-10-12',
    price: 500
  }
]
const tactivityIndex = ref<number>(0)
</script>

<style lang="scss" scoped>
.bg-scale-110 {
  transition: transform 0.5s ease-in-out;
}

.bg-scale-110:hover {
  transform: scale(1.05);
}
.wrapper {
  font-family: 'Poppins', sans-serif;
}

.wrapper .icon {
  background: #fff;
  border-radius: 50%;

  width: 40px;
  height: 40px;
  font-size: 18px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
  cursor: pointer;
}

.wrapper .tooltip {
  position: absolute;
  top: 0;
  font-size: 14px;
  background: #fff;
  color: #fff;
  padding: 5px 8px;
  border-radius: 5px;
  box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
  opacity: 0;
  pointer-events: none;
  transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.wrapper .tooltip::before {
  position: absolute;
  content: '';
  height: 8px;
  width: 8px;
  background: #fff;
  bottom: -3px;
  left: 50%;
  transform: translate(-50%) rotate(45deg);
  transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.wrapper .icon:hover span,
.wrapper .icon:hover .tooltip {
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.1);
}

.wrapper svg {
  fill: green;
}

.wrapper span:hover,
.wrapper svg:hover,
.wrapper .black:hover,
.wrapper .black:hover .tooltip,
.wrapper .black:hover .tooltip::before {
  background: #ccc;
  color: white;
  fill: white;
}

.n-divider:not(.n-divider--vertical) {
  margin: 0;
}

.carousel-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.custom-arrow {
  display: flex;
  position: absolute;
  bottom: 25px;
  right: 10px;
}

.custom-arrow button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 28px;
  height: 28px;
  margin-right: 12px;
  color: #fff;
  background-color: rgba(255, 255, 255, 0.1);
  border-width: 0;
  border-radius: 8px;
  transition: background-color 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  cursor: pointer;
}

.custom-arrow button:hover {
  background-color: rgba(255, 255, 255, 0.2);
}

.custom-arrow button:active {
  transform: scale(0.95);
  transform-origin: center;
}

.custom-dots {
  display: flex;
  margin: 0;
  padding: 0;
  position: absolute;
  bottom: 20px;
  left: 20px;
}

.custom-dots li {
  display: inline-block;
  width: 12px;
  height: 4px;
  margin: 0 3px;
  border-radius: 4px;
  background-color: rgba(255, 255, 255, 0.4);
  transition:
    width 0.3s,
    background-color 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  cursor: pointer;
}

.custom-dots li.is-active {
  width: 40px;
  background: #fff;
}

.btn {
  @apply border border-[#ffffff] text-white;
}

.btn-white-outline:hover {
  @apply bg-[#ffffff] text-black;
}
</style>
