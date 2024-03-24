declare namespace Trails {
  interface trails {
    id: number
    name: string
    himg: string
    option: string
    x: number
    y: number
    optype: string
    act: number
    scor: number
    son: number
    enname: string
    address: string
    results: string[{
      id: string
      trail_src: string
      trail_id: number
    }]
  }
  interface activate {
    id: number
    name: string
    yid: number
    yname: string
    img: string
    people: number
    title: string
  }
  // 订单
  interface ordergoods {
    id: string
    trail_name: string
    name: string
    phone: number
    score: number
    son: number
    trail_img: string
    perple: number
    starttime: number
    endtime: number
    end: number
    act: string
    scores: number
    option: string
    user_id: string
  }
}
