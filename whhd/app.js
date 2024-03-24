const express = require("express");
// 创建服务器实例
const app = express();
// 配置跨域
const cors = require("cors");
app.use(cors());

// 导入验证规则的模块用来写捕获失败的情况
const joi = require("joi");
// 导入保存图片到本地的包
const multer = require('multer');
// 定义文件存储位置
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
       cb(null, 'D:/作业/whmc/whmc/public/img');
    },
    filename: function (req, file, cb) {
       cb(null, `${file.originalname.length}${Date.now()}.${file.mimetype.split('/')[1]}`);
    }
   });
const upload = multer({ storage: storage });
    // 导出 upload 中间件
module.exports.upload = upload;
// 解析表单的中间件de 参数
app.use(express.urlencoded({ extended: false }));
// 封装一个中间件，简化res.send的操作
app.use((req, res, next) => {
    res.cc = (err, status = 1) => {
      res.send({
        status,
        message: err instanceof Error ? err.message : err,
      });
    };
    next();
  });

// 解析 token 的中间件
var { expressjwt: jwt } = require("express-jwt");
// 导入解析token字段的配置文件
const config = require("./config");
// 使用 .unless({ path: [/^\/api\//] }) 指定哪些接口不需要进行 Token 的身份认证
app.use(
  jwt({ secret: config.jwtsecrekey ,algorithms: ['HS256']}).unless({ path: [/^\/api\//] })
);

// 导入登录和注册路由模块
const userRouter = require("./router/user");
// 获取用户信息
const userinfoRouter = require("./router/userinfo");
// 获取营地
const usershopRouter = require('./router/trail');
// 动态
const postsRouter = require('./router/posts');
app.use("/api", userRouter);
app.use("/my", userinfoRouter);
app.use('/trail',usershopRouter);
app.use('/posts',postsRouter);

// 配置全局的错误中间件
app.use((err, req, res, next) => {
    // 数据验证失败
    if (err instanceof joi.ValidationError) return res.cc(err);
    else if (err.name === "UnauthorizedError") {
      return res.cc("登录已过期，请重新登录");
    }
    // 未知错误
    else {
      res.cc(err);
    }
  });

  // 指定端口和启动服务器
  app.listen(3007, () => {
    console.log("127.0.0.1:3007");
  });

