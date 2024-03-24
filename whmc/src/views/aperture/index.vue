<template>
  <div>
    <div class="w-[1100px] m-auto">
      <div class="w-full mt-[50px]">
        <div class="image-container">
          <div
            v-for="i in usepost.post"
            :key="i.id"
            class="image-wrapper rounded-[20px] overflow-hidden"
          >
            <div>
              <n-image
                width="265.9px"
                :src="i.images[0].path"
                :intersection-observer-options="{
                  root: '#image-scroll-container'
                }"
                ><template #placeholder>
                  <div
                    style="
                      width: 358.4px;
                      height: 200px;
                      display: flex;
                      align-items: center;
                      justify-content: center;
                    "
                  >
                    加载中.....
                  </div>
                </template></n-image
              >
              <div @click="model(i)" class="w-[336px] p-[12px] pt-[6px] flex flex-col">
                <div class="mb-[12px]">
                  <p class="text-[15px] m-0">{{ i.name }}</p>
                </div>
                <div class="h-[23px] flex item-center content-center">
                  <img :src="i.user_img" class="w-[23px] h-[23px] mr-[5px]" alt="" />
                  <p class="text-[14px] m-0">{{ i.user_name }}</p>
                  <p class="text-[12px] leading-[25px] m-0 ml-[20px]">{{ i.created_at }}</p>
                  <p class="text-[12px] leading-[25px] m-0 ml-[20px]">{{ i.option }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <n-modal v-model:show="showModal">
      <n-card
        style="width: 961px; height: 647.5px; border-radius: 20px; padding: 0"
        :bordered="false"
        size="huge"
        role="dialog"
        aria-modal="true"
      >
        <div class="no-padding w-full h-full flex">
          <div class="w-[561px] h-full relative overflow-hidden">
            <ul
              class="m-0 p-0 list-none h-full flex"
              :style="{
                transform: `translateX(-${hotIndex * 561}px)`,
                transition: 'transform 0.5s ease-in-out'
              }"
            >
              <li v-for="i in postinfo.images" class="w-full h-full flex items-center">
                <img :src="i.path" class="w-[561px]" alt="" />
              </li>
            </ul>
            <div
              class="absolute w-[40px] rounded-[10px] text-center h-[20px] bg-[#ccc] bg-opacity-[0.4] top-0 right-0"
              ext-cent
            >
              {{ `${hotIndex + 1}/${postinfo.images.length}` }}
            </div>
            <div class="absolute top-[50%] mt-[-16px] left-0" @click="hotadd">
              <ArrowBackCircleOutline class="w-[32px]" />
            </div>
            <div class="absolute top-[50%] mt-[-16px] right-0" @click="hotjian">
              <ArrowForwardCircleOutline class="w-[32px]" />
            </div>
          </div>
          <div class="w-[320px] h-[96%] flex flex-col">
            <div class="flex items-center justify-between pl-[20px] pb-[20px]">
              <div class="flex items-center">
                <img :src="postinfo.user_img" alt="" class="w-[40px] h-[40px] rounded-[20px]" />
                <p class="m-0 text-[16px] pl-[12px]">{{ postinfo.user_name }}</p>
              </div>
              <div
                v-if="like"
                @click="dellike"
                class="p-[5px] cursor-pointer rounded-[20px] flex items-center borderred"
              >
                <svg
                  t="1709976516779"
                  class="icon"
                  viewBox="0 0 1024 1024"
                  version="1.1"
                  xmlns="http://www.w3.org/2000/svg"
                  p-id="5987"
                  width="20"
                  height="20"
                >
                  <path
                    d="M913.92 208.384c-98.816-98.816-258.56-98.816-357.376 0l-41.984 41.984-41.984-41.984c-98.816-98.816-258.56-98.816-357.376 0-98.304 98.816-98.304 258.56 0.512 357.376l52.224 52.224 337.408 337.408c5.632 5.632 14.336 5.632 19.968 0l337.408-337.408 52.224-52.224c97.792-98.816 97.792-258.56-1.024-357.376z"
                    fill="#d81e06"
                    p-id="5988"
                  ></path>
                </svg>
                <p class="m-0 pl-[4px] text-[14px] text-red-500">已点赞{{ manlike }}</p>
              </div>
              <div
                @click="addlike"
                v-else
                class="p-[5px] cursor-pointer rounded-[20px] flex items-center borderccc"
              >
                <svg
                  t="1709976516779"
                  class="icon"
                  viewBox="0 0 1024 1024"
                  version="1.1"
                  xmlns="http://www.w3.org/2000/svg"
                  p-id="5987"
                  width="20"
                  height="20"
                >
                  <path
                    d="M913.92 208.384c-98.816-98.816-258.56-98.816-357.376 0l-41.984 41.984-41.984-41.984c-98.816-98.816-258.56-98.816-357.376 0-98.304 98.816-98.304 258.56 0.512 357.376l52.224 52.224 337.408 337.408c5.632 5.632 14.336 5.632 19.968 0l337.408-337.408 52.224-52.224c97.792-98.816 97.792-258.56-1.024-357.376z"
                    fill="#8a8a8a"
                    p-id="5988"
                  ></path>
                </svg>
                <p class="m-0 pl-[4px] text-[14px] text-[##8a8a8a]">请点赞{{ manlike }}</p>
              </div>
            </div>
            <div class="flex flex-col pl-[20px]">
              <h2 class="m-0 mb-[8px]">{{ postinfo.name }}</h2>
              <p class="m-0 text-[16px] text-[#333333]">{{ postinfo.constent }}</p>
              <p class="m-0 mt-[12px] text-[12px] text-[#33333399]">{{ postinfo.created_at }}</p>
            </div>
            <div class="pl-[20px]"><n-divider class="m-auto" /></div>
            <n-virtual-list style="max-height: 345px" :item-size="42" :items="comments">
              <template #default="{ item }">
                <div :key="item.id" class="flex mb-[16px] pl-[20px]">
                  <img class="avatar" :src="item.user_img" alt="" />
                  <div class="ml-[16px]">
                    <p class="m-0 text-[14px] text-[#33333399]">{{ item.user_name }}</p>
                    <p class="m-0 text-[14px] text-[#333333]">{{ item.content }}</p>
                    <p class="m-0 my-[8px] text-[12px] text-[#33333399]">{{ item.time }}</p>
                  </div>
                </div>
              </template>
            </n-virtual-list>
          </div>
          <div
            class="absolute w-[320px] px-[20px] pt-[16px] flex justify-between right-0 bottom-[16px] bordertop"
          >
            <n-input v-model:value="comment" type="text" placeholder="请输入评论" />
            <n-button type="success" class="rounded-[20px] ml-[10px]" @click="setcomment">
              发送
            </n-button>
          </div>
        </div>
      </n-card>
    </n-modal>
  </div>
</template>
<script setup lang="ts">
import { ref } from 'vue'
import { usePost } from '@/stores/modules/posts'
import { ArrowBackCircleOutline, ArrowForwardCircleOutline } from '@vicons/ionicons5'
import { likeman, getComments, createComment, getlike, likes, unlike } from '@/service/api/posts'
import { useUser } from '@/stores/modules/auth'
import { getCurrentDateFormatted } from '@/utils/common/time'
const User = useUser()
const usepost = usePost()
usepost.getpost()
const showModal = ref(false)
const hotIndex = ref<number>(0)

const hotadd = () => {
  if (hotIndex.value > 0) {
    hotIndex.value--
  }
}
const hotjian = () => {
  if (hotIndex.value < postinfo.value.images.length - 1) {
    hotIndex.value++
  }
}

const postinfo = ref<Posts.post>({
  id: 'string',
  name: 'string',
  constent: 'string',
  user_id: 'string',
  user_name: 'string',
  user_img: 'string',
  created_at: 'string',
  like: 0,
  option: 'string',
  images: []
})
const like = ref<boolean>(false)

const comments = ref<Posts.comments[]>([])
const manlike = ref<number>(0)
const model = async (i: Posts.post) => {
  hotIndex.value = 0
  showModal.value = true
  postinfo.value = i

  const {
    data: { data }
  } = await getComments(postinfo.value.id)
  comments.value = data

  const acts = await getlike(postinfo.value.id, User.user.id)
  like.value = acts.data.data

  const man = await likeman(postinfo.value.id)
  manlike.value = man.data.data[0].count
}

const comment = ref<string>('')
const setcomment = async () => {
  if (comment.value) {
    const time = getCurrentDateFormatted()
    await createComment({
      id: '',
      post_id: postinfo.value.id,
      content: comment.value,
      user_id: User.user.id,
      user_img: User.user.img,
      user_name: User.user.name,
      time: time
    })
    comment.value = ''
    const {
      data: { data }
    } = await getComments(postinfo.value.id)
    comments.value = data
  }
}

// 点赞
const addlike = async () => {
  await likes(postinfo.value.id, User.user.id)
  const {
    data: { data }
  } = await getlike(postinfo.value.id, User.user.id)
  like.value = data
  const man = await likeman(postinfo.value.id)
  manlike.value = man.data.data[0].count
}

// 取消点赞
const dellike = async () => {
  await unlike(postinfo.value.id, User.user.id)
  const {
    data: { data }
  } = await getlike(postinfo.value.id, User.user.id)
  like.value = data
  const man = await likeman(postinfo.value.id)
  manlike.value = man.data.data[0].count
}
</script>
<style lang="scss" scoped>
.bordersda {
  border: 2px solid #ccc;
}

.image-container {
  width: 1100px;

  margin: 0 auto; /* 居中 */
  column-count: 4; /* 设置列数 */
  column-gap: 10px; /* 设置列间距 */
}

.image-wrapper {
  border: 1px solid #ccc;
  margin-bottom: 10px;
  /* 移除宽度设置 */
}

::deep(.lazy-image) {
  height: auto; /* 使图片高度自适应 */
}
.no-padding {
  padding: 0 !important;
}
.item {
  display: flex;
  align-items: center;
}
.avatar {
  width: 35px;
  height: 35px;
  border-radius: 50%;
}
.bordertop {
  border-top: 1px solid #ccc;
}
.borderred {
  border: 2px solid red;
}
.borderccc {
  border: 2px solid #8a8a8a;
}
</style>
