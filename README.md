# VUE和NODE实现
该系统是一个专门为旅客设计的露营信息平台，利用Vue框架和Node.js进行前后端分离开发，以提供丰富的露营地点和活动信息。用户可以通过系统预约露营地点和活动，查看地理位置，并分享个人的露营体验。此外，系统还包含动态，用户分享游玩心得，从而提高旅客游玩体验。系统核心功能包括露营地点和活动的信息展示、地理位置展示以及动态社区。用户可以通过系统浏览各种露营地点和活动，了解它们的详细信息，包括地理位置、活动内容等。动态社区是系统的一个重要组成部分，用户可以在这里分享自己的露营体验，包括游玩心得、活动照片等。这不仅可以帮助其他用户了解露营地点和活动，也可以让用户分享自己的旅行故事，增加了用户之间的互动和社区氛围。这个系统是一个集露营信息展示、地理位置查看和社区互动于一体的平台。

项目基于：vue3+node.js+ts

页面只有登录制作了响应式，其他地方正在完善
主题可以切换暗黑模式，路由切换加入vue的切换动画

ui界面搭建使用的[naive-ui](https://www.naiveui.com/zh-CN/light)
css框架使用[tailwind](https://tailwind.nodejs.cn/)

### 以下是部分页面
登录:使用jwt验证，手机验证码登录（用到了腾讯云sdk），用户信息会被缓存，密码会被加密处理。
<img src="https://github.com/mayfwl/whmc/raw/main/img/1.png" style="width=210px" />
<img src="https://github.com/mayfwl/whmc/raw/main/img/2.png" style="width=210px" /> <br />
主页：
<img src="https://github.com/mayfwl/whmc/raw/main/img/3.png" style="width=210px" />
<img src="https://github.com/mayfwl/whmc/raw/main/img/5.png" style="width=210px" />
推荐页面：性能上还需要优化（推荐这里加入触底加载，详情，订单页面会缓存）
<img src="https://github.com/mayfwl/whmc/raw/main/img/4.png" style="width=210px" /><img src="https://github.com/mayfwl/whmc/raw/main/img/6.png" style="width=210px" /><img src="https://github.com/mayfwl/whmc/raw/main/img/7.png" style="width=210px" />
动态：采用比较流行的流体布局，评论区使用的虚拟列表，图片懒加载。后端是根据用户
点击动态，在根据点击的id发去请求获取发布人的信息，动态所有图片，动态点赞信息，动态评论等，node后端用到了promise，发布图片存储到本地。
<img src="https://github.com/mayfwl/whmc/raw/main/img/9.png" style="width=210px" /><img src="https://github.com/mayfwl/whmc/raw/main/img/11.png" style="width=210px" />
个人：
![](https://github.com/mayfwl/whmc/raw/main/img/10.png)
