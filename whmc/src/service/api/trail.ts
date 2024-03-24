import axios from '../request/index'

// 发送获取营地
export const getTrails = () => {
  return axios({
    url: '/trail/all',
    method: 'GET'
  })
}

// 根据id获取营地信息
export const getTrailById = (id: number) => {
  return axios({
    url: '/trail/info',
    method: 'GET',
    params: {
      id: id
    }
  })
}

// 获取对应的活动
export const getTrailsByAct = (yid: number) => {
  return axios({
    url: '/trail/act',
    method: 'GET',
    params: {
      yid: yid
    }
  })
}

// 下单后生成一个订单
export const createOrder = (model: Trails.ordergoods) => {
  return axios({
    url: '/trail/order',
    method: 'POST',
    data: model,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  })
}
