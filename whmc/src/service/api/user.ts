import axios from '../request/index'

// 发送注册的请求
export const resApi = ({ name, pwd, phone, code }: User.model) => {
  return axios({
    url: '/api/reg',
    method: 'POST',
    data: {
      name: name,
      pwd: pwd,
      phone: phone,
      code: code
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}
// 验证码登录
export const codeApi = (model: { phone: string; code: string }) => {
  return axios({
    url: '/api/codelogin',
    method: 'POST',
    data: model,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}
// 发送修改密码的请求
export const respwdApi = (model: User.model) => {
  return axios({
    url: '/api/respwd',
    method: 'POST',
    data: model,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}

// 发送pwd登录
export const pwdLoginApi = (model: { name: string; pwd: string }) => {
  return axios({
    url: '/api/login',
    method: 'POST',
    data: model,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}

// yzm
export const codeapi = (phone: string) => {
  return axios({
    url: '/api/huoqucode',
    method: 'POST',
    data: phone
  })
}
