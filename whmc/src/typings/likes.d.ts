declare namespace Likes {
  /**
   * 喜欢模块
   * - works: 作品
   * - users: 用户
   */
  type Likelist = {
    id: number
    name: string
    userimg: string
    account: string
    img: string
    likes: number
    works: number
  }
}
