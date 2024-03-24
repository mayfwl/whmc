import { useUser } from '@/stores/modules/auth'
import axios from '../request/index'

// 获取用户信息
export const getUserInfoApi = () => {
  const user = useUser()
  return axios({
    url: '/my/userinfo',
    method: 'GET',
    headers: {
      Authorization: user.token
    }
  })
}

// 获取用户喜欢数量
export const getlikenum = () => {
  const user = useUser()
  return axios({
    url: '/my/like',
    method: 'GET',
    headers: {
      Authorization: user.token
    }
  })
}

// 获取用户作品数量
export const getpostnum = () => {
  const user = useUser()
  return axios({
    url: '/my/posts',
    method: 'GET',
    headers: {
      Authorization: user.token
    }
  })
}
// 获取用户预约数量
export const getordernum = () => {
  const user = useUser()
  return axios({
    url: '/my/order',
    method: 'GET',
    headers: {
      Authorization: user.token
    }
  })
}

// 修改信息
export const getedit = (u: { name: string; img: string; title: string }) => {
  const user = useUser()
  return axios({
    url: '/my/edit',
    method: 'POST',
    data: {
      name: u.name,
      img: u.img,
      title: u.title
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      Authorization: user.token
    }
  })
}

// 获取用户喜欢
export const getlikes = () => {
  const user = useUser()
  return axios({
    url: '/my/likes',
    method: 'GET',
    headers: {
      Authorization: user.token
    }
  })
}

// 获取用户的作品
export const getworks = () => {
  const user = useUser()
  return axios({
    url: '/my/works',
    method: 'GET',
    headers: {
      Authorization: user.token
    }
  })
}

// 获取用户所有订单
export const getorder = () => {
  const user = useUser()
  return axios({
    url: '/my/orderinfo',
    method: 'GET',
    headers: {
      Authorization: user.token
    }
  })
}
