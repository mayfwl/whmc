import axios from '../request/index'

// 发布动态
export const createPost = (formData: FormData) => {
  return axios({
    url: '/posts/uploads',
    method: 'POST',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}

// 发送请求获取到全部的动态
export const getPosts = () => {
  return axios({
    url: '/posts/all',
    method: 'GET'
  })
}

// 获取评论
export const getComments = (id: string) => {
  return axios({
    url: '/posts/comments',
    method: 'GET',
    params: {
      id: id
    }
  })
}

// 发出评论
export const createComment = (comment: Posts.comments) => {
  return axios({
    url: '/posts/comments',
    method: 'POST',
    data: comment,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}

// 判断是否点赞过
export const getlike = (post_id: string, user_id: string) => {
  return axios({
    url: '/posts/like',
    method: 'POST',
    data: {
      posts_post_id: post_id,
      posts_user_id: user_id
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}
// 点赞
export const likes = (post_id: string, user_id: string) => {
  return axios({
    url: '/posts/addlike',
    method: 'POST',
    data: {
      posts_post_id: post_id,
      posts_user_id: user_id
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}
// 取消点赞
export const unlike = (post_id: string, user_id: string) => {
  return axios({
    url: '/posts/unlike',
    method: 'POST',
    data: {
      posts_post_id: post_id,
      posts_user_id: user_id
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}

// 作品点赞数
export const likeman = (post_id: string) => {
  return axios({
    url: '/posts/likeman',
    method: 'POST',
    data: {
      posts_post_id: post_id
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}
