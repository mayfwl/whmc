declare namespace Posts {
  interface post {
    id: string
    name: string
    constent: string
    user_id: string
    user_name: string
    user_img: string
    created_at: string
    like: number
    option: string
    images: images[]
  }
  interface comments {
    id: string
    post_id: string
    user_id: string
    user_name: string
    user_img: string
    content: string
    time: string
  }
  interface images {
    id: string
    post_id: string
    path: string
  }
}
