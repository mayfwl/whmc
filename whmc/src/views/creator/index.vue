<template>
  <div>
    <div
      class="relative w-[870px] px-[115.4px] shadow-2xl rounded-[20px] py-[40px] mt-[25px] m-auto"
    >
      <div>
        <h2 class="mt-0 text-[25px]">发布图文动态</h2>
        <div class="w-full flex justify-between">
          <div class="w-[552px]">
            <div>
              <h4 class="mt-[24px] mb-[4px]">作品描述</h4>
              <div
                class="headtitle rounded-[5px] w-[528px] h-[199.8px] px-[12px] pt-[8px] bg-[#F2F2F4] pb-[12px]"
              >
                <div>
                  <div class="pb-[8px] borderbot mb-[8px] relative">
                    <input
                      type="text"
                      maxlength="20"
                      v-model="name"
                      placeholder="添加作品标题"
                      class="outline-none border-none focus:border-none shadow-none w-full text-[14px] font-semibold bg-[#F2F2F4]"
                    />

                    <div
                      v-show="name.length >= 20"
                      class="text-[#ff726d] text-[12px] leading-[16.8px] absolute top-[3px] right-0"
                    >
                      标题最多20个字
                    </div>
                  </div>
                </div>
                <div class="w-full h-[138px]">
                  <textarea
                    ref="textareaRef"
                    placeholder="添加作品描叙..."
                    maxlength="1000"
                    v-model="constent"
                    style="width: 100% !important; height: 138px !important ; overflow: hidden"
                    class="resize-none outline-none border-none focus:border-none shadow-none w-full h-[138px] text-[14px] bg-[#F2F2F4]"
                  >
                  </textarea>
                </div>
                <div class="flex justify-end w-full h-[18px] text-[#25263299] text-[12px]">
                  {{ constent.length }}/1000
                </div>
              </div>
            </div>
            <div>
              <h4 class="mt-[24px] mb-[4px]">上传图片</h4>
              <div class="w-full">
                <n-upload
                  :default-file-list="previewFileList"
                  list-type="image-card"
                  @change="handleFileChange"
                  :multiple="true"
                /><!-- 查看事件preview -->
                <!-- <n-modal v-model:show="showPlus" preset="card" style="width: 600px" title="">
                <img :src="previewImageUrl" style="width: 100%" />
              </n-modal> bug未解决-->
              </div>
            </div>
            <div>
              <h4 class="mt-[24px] mb-[4px]">添加位置</h4>
              <div class="w-full flex justify-between">
                <div
                  class="text-[14px] w-[102.4px] h-[30.4px] bg-[#F2F2F4] font-semibold leading-[30.4px] text-center"
                >
                  位置：
                </div>
                <div class="bg-[#F2F2F4] w-[438.4px] h-[30.4px]">
                  <input
                    type="text"
                    placeholder="请输入位置信息"
                    v-model="option"
                    class="p-0 ml-[12px] text-[14px] w-[414.4px] h-[30.4px] font-semibold bg-[#F2F2F4] resize-none outline-none border-none shadow-none"
                  />
                </div>
              </div>
            </div>
            <div class="mt-[40px]">
              <n-button @click="uploadAllFiles" class="w-[120px] h-[32px] mr-[12px]" type="primary">
                发布
              </n-button>
              <n-button @click="$router.go(-1)" class="w-[120px] h-[32px]" secondary>
                取消
              </n-button>
            </div>
          </div>
          <div class="w-[270px]">
            <div
              class="flex flex-col justify-center items-center content-center w-full h-[515px] bg-[#F2F2F4]"
            >
              <div
                v-if="previewFileList.length < 1"
                class="flex flex-col justify-center items-center content-center"
              >
                <div>
                  <img
                    src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0yMy43ODYyIDEwLjc0NDRDMjIuOTExOCA2Ljg4MzAxIDE5LjQ1OTMgNCAxNS4zMzM1IDRDMTAuNTQ3IDQgNi42NjY4MyA3Ljg4MDIgNi42NjY4MyAxMi42NjY3QzYuNjY2ODMgMTMuMzYwNSA2Ljc0ODM2IDE0LjAzNTMgNi45MDIzNiAxNC42ODE5QzMuNzg5ODggMTQuOTAyOSAxLjMzMzUgMTcuNDk3OSAxLjMzMzUgMjAuNjY2N0MxLjMzMzUgMjMuOTgwNCA0LjAxOTc1IDI2LjY2NjYgNy4zMzM0MyAyNi42NjY3SDIyLjY2NjhDMjcuMDg1MSAyNi42NjY3IDMwLjY2NjggMjMuMDg0OSAzMC42NjY4IDE4LjY2NjdDMzAuNjY2OCAxNC42MjgzIDI3LjY3NDYgMTEuMjg4OCAyMy43ODYyIDEwLjc0NDRaTTE2LjQyNyAxMS4wMjIzQzE2LjE3OTcgMTAuODE2MyAxNS44MjA2IDEwLjgxNjMgMTUuNTczNCAxMS4wMjIzTDguNzA3NDUgMTYuNzQzOUM4LjQ2Nzk1IDE2Ljk0MzUgOC42MDkwOCAxNy4zMzMzIDguOTIwODUgMTcuMzMzM0gxMy4zMzM1VjIzLjMzMzNDMTMuMzMzNSAyMy43MDE1IDEzLjYzMiAyNCAxNC4wMDAyIDI0SDE4LjAwMDJDMTguMzY4NCAyNCAxOC42NjY4IDIzLjcwMTUgMTguNjY2OCAyMy4zMzMzVjE3LjMzMzNIMjMuMDc5NUMyMy4zOTEyIDE3LjMzMzMgMjMuNTMyNCAxNi45NDM1IDIzLjI5MjkgMTYuNzQzOUwxNi40MjcgMTEuMDIyM1oiIGZpbGw9IiM5QjlFQTAiLz4KPC9zdmc+Cg=="
                    alt=""
                  />
                </div>
                <div class="text-[14px] text-[#1c1f23cc] font-semibold">大图显示</div>
                <div class="text-[14px] text-[#1c1f23cc] font-semibold">
                  上传的图片文件到此区域区域显示
                </div>
              </div>
              <div
                v-if="previewFileList.length >= 1"
                class="w-full flex justify-center items-center"
              >
                <img class="w-[245px]" :src="previewImageUrl" alt="" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div
        v-if="isLoading"
        class="bg-white bg-opacity-50 w-[870px] backdrop-opacity-50 h-[631.75px] px-[115.4px] py-[40px] absolute top-0 right-0"
      >
        <div class="w-full h-full flex justify-center items-center">
          <n-spin size="large" />
        </div>
      </div>
    </div>
  </div>
</template>
<script lang="ts" setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { type UploadFileInfo } from 'naive-ui'
import { formatDate } from '@/utils/common/time'
import { useUser } from '@/stores/modules/auth'
import { useMessage } from 'naive-ui'
import { createPost } from '@/service/api/posts'
import { useRouter } from 'vue-router'
const isLoading = ref<boolean>(false)
const router = useRouter()
const message = useMessage()
const User = useUser()
// 作品题目
const name = ref<string>('')
// 作品描叙
const constent = ref<string>('')
// 发布位置
const option = ref<string>('')
const textareaRef = ref<HTMLTextAreaElement>()

// 大图
const previewImageUrl = ref<string>('')
// 放大图片查看
const handlePreview = (file: UploadFileInfo) => {
  const { url } = file
  previewImageUrl.value = url as string
}
// bug未解决

const selectedFiles = ref<FileObject[]>([])

interface FileObject {
  id: string
  name: string
  file: File
}
// 这是event定义一个类型
interface FileChangeEvent {
  file: FileObject
  fileList: FileObject[] // 假设 fileList 是一个包含 FileObject 对象的数组
  event: Event // 假设 event 是一个 Event 对象
}
const handleFileChange = (event: FileChangeEvent) => {
  // 这里的event是一个自定义事件，他是naive定义的
  // 从事件对象中获取文件列表
  const fileList = event.fileList
  // fileList 是一个包含 File 对象的数组
  previewFileList.value = []
  fileList.forEach((file: FileObject) => {
    // 创建一个新的文件对象，包含必要的属性
    const newFile: UploadFileInfo = {
      id: file.id, // 或者其他唯一标识符
      name: file.name,
      status: 'finished', // 假设文件已经上传完成
      url: URL.createObjectURL(file.file) // 创建一个临时的 URL 来显示文件
    }
    // 将新文件对象追加到 previewFileList 中
    previewFileList.value.push(newFile)
    handlePreview(previewFileList.value[previewFileList.value.length - 1])
  })
  selectedFiles.value = [...fileList]
}
const uploadAllFiles = async () => {
  isLoading.value = true
  const formData = new FormData()
  // FormData对象用于构建一个表单数据集合，它可以包
  // 含文本字段和文件。这对于文件上传非常有用，因为它允许你
  // 将文件和其他表单数据一起发送到服务器。
  selectedFiles.value.forEach((file, index) => {
    formData.append(`files`, file.file)
  })

  // 获取发布作品的时间
  const created = new Date()
  const created_at = ref<string>(formatDate(created.getTime()))
  formData.append('name', name.value)
  formData.append('constent', constent.value)
  formData.append('user_name', User.user.name)
  formData.append('user_id', User.user.id)
  formData.append('user_img', User.user.img)
  formData.append('created_at', created_at.value)
  formData.append('like', '0') // 注意：如果 like 是数字，确保它被正确地转换为字符串
  formData.append('option', option.value)
  // 使用 FormData.entries() 遍历并打印 formData 的内容
  // for (let [key, value] of formData.entries()) {
  //   console.log(key, value)
  // }
  const { data } = await createPost(formData)
  selectedFiles.value = []
  // 发布之后等待一下后端的响应在跳转
  if (data.status === 0) {
    isLoading.value = false
    message.success(data.message)
    router.push({ path: '/aperture' })
    return
  }
}

const previewFileList = ref<UploadFileInfo[]>([])

const handleWheel = (event: WheelEvent) => {
  // document.activeElement是获取当前元素的焦点
  if (document.activeElement === textareaRef.value) {
    // 如果焦点在 textarea就执行以下代码
    const deltaY = event.deltaY
    const scrollTop = textareaRef.value.scrollTop
    textareaRef.value.scrollTop = scrollTop + deltaY

    // 阻止默认滚动行为
    event.preventDefault()
  }
}

onMounted(() => {
  // 在挂载页面绑定事件
  if (textareaRef.value) textareaRef.value.addEventListener('wheel', handleWheel)
})

onUnmounted(() => {
  // 页面关闭卸载的时候清理
  if (textareaRef.value) textareaRef.value.removeEventListener('wheel', handleWheel)
})
</script>

<style lang="scss" scoped>
.borders {
  border: 1px solid #ccc;
}

.headtitle {
  border: 1px solid #f2f2f4;
}
.headtitle:hover {
  border: 1px solid rgb(125, 125, 241);
}

.borderbot {
  border-bottom: 2px solid #e4e4e6;
}
.n-upload-dragger {
  padding: 0;
}
</style>
