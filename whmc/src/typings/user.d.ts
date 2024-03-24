declare namespace User {
  interface users {
    name: string
    account: string
    img: string
    likes: number
    works: number
    makes: number
    synopsis: string | null
  }
  interface user {
    // 登录的信息
    id: string
    phone: number
    img: string
    name: string
    title: string
    pwd: string
  }
  interface model {
    phone: string
    code: string | null
    pwd: string
    name: string
  }
}
