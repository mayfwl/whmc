// 为主函数提供路由
const express = require("express");
const { upload } = require('../app.js');
// 创建路由对象
const router = express.Router();
// 导入动态操作函数。
const posts = require("../router_handler/posts");
// 获取动态
router.get("/all", posts.getPosts);
// 发布动态
router.post('/uploads',upload.array('files',4), posts.uploadPosts);
// 获取评论
router.get('/comments',posts.getComments);
// 发布评论
router.post('/comments',posts.createComment);

// 是否点赞查询
router.post('/like',posts.getlike)

// 点赞
router.post('/addlike',posts.like)
// 取消点赞
router.post('/unlike',posts.unlike)
// 点赞人数
router.post('/likeman',posts.likeman)
module.exports = router;

