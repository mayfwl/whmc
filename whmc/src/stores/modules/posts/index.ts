import { defineStore } from 'pinia'
import { useRoute } from 'vue-router'

import { getPosts } from '@/service/api/posts'

const route = useRoute()
export const usePost = defineStore('post-store', {
  state: () => {
    return {
      post: [
        {
          id: '',
          name: '',
          constent: '',
          user_id: '',
          user_name: '',
          user_img: '',
          created_at: '',
          like: 0,
          option: '',
          images: [
            {
              id: '',
              path: '',
              post_id: ''
            }
          ] as Posts.images[]
        }
      ] as Posts.post[],
      activeKey: 'likes'
    }
  },
  actions: {
    // 获取到数据
    async getpost() {
      const {
        data: { data }
      } = await getPosts()
      this.post = data
    }
  }
})
