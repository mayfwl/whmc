// 瀑布流组件

export interface IwaterfallProps {
  gap: number
  column: number
  pageSize: number
  request: (page: number, pageSize) => Promise<IImageItem[]>
}

export interface IImageItem {
  id: string | number
  url: string
  width: number
  height: number
  [key: string]: any
}
