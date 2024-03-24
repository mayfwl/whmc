//对用户的信息的一些炒作
// 导入数据库模块
const db = require("../db/index");

// 获取用户信息
exports.getUserInfo = (req, res) => {
    // 定义获取数据库信息的sql语句
    const sql = "select * from user where id=?";
    // 注意：req 对象上的 user 属性，是 Token 解析成功，express-jwt 中间件帮我们挂载上去的
    db.query(sql, req.auth.id, (err, results) => {
      if (err) return res.cc(err);
      // 查询结果不止一行
      if (results.length > 1) return res.cc("获取用户信息失败");
      // 3. 将用户信息响应给客户端
      const user={...results[0],pwd:''}
      res.send({
        status: 0,
        message: "获取用户基本信息成功！",
        data: user,
      });
    });
  };

  // 获取点赞数量
  exports.getLikenum=(req,res)=>{
    const sql='select count(*) as count from likes where posts_user_id=?'
    db.query(sql,req.auth.id,(err,results)=>{
      if (err) return res.cc(err);
      res.send({
        status: 0,
        message: "获取成功",
        data: results
      });
    })
  }
// 获取作品数量
  exports.getpostsnum=(req,res)=>{
    const sql='select count(*) as count from posts where user_id=?'
    db.query(sql,req.auth.id,(err,results)=>{
      if (err) return res.cc(err);
      res.send({
        status: 0,
        message: "获取成功",
        data: results
      });
    })
  }

  // 获取订单数量
  exports.getordernum=(req,res)=>{
    const sql='select count(*) as count from order_goods where user_id=?'
    db.query(sql,req.auth.id,(err,results)=>{
      if (err) return res.cc(err);
      res.send({
        status: 0,
        message: "获取成功",
        data: results
      });
    })
  }

  // 修改用户信息
  exports.edit = (req, res) => {
    console.log({...req.body});
    const sql = "update user set ? where id=?";
    db.query(sql, [req.body, req.auth.id], (err, results) => {
      if (err) return res.cc(err);
      if (results.affectedRows !== 1) return res.cc("修改用户信息失败");
      res.cc("修改用户信息成功", 0);
    });
  }

  // 获取用户喜欢列表
  exports.getlikeinfo=(req,res)=>{
    
    const sql='select * from posts where id in (select posts_post_id from likes where posts_user_id=?)'
    db.query(sql,req.auth.id,(err,results)=>{
      if (err) return res.cc(err);
     
      const likepost=results
      const postpromise= likepost.map(post=>{
        return new Promise((resolve, reject) => {
          // 获取图片
          const sqlimg = "select * from images where post_id=?";
          db.query(sqlimg, post.id, (err, images) => {
            if (err) reject(err);
            post.images = images; // 将图片添加到帖子中
              resolve(post)
          });  
        });  
        });
   
        Promise.all(postpromise).then(results => {   
          res.send({
            status: 0,
            message: "获取成功",
            data: results
          });
        })
    })
  }

  exports.getworkinfo=(req,res)=>{
    const sql='select * from posts where user_id=?'
    db.query(sql,req.auth.id,(err,results)=>{
      if (err) return res.cc(err);
      const likepost=results
      const postpromise= likepost.map(post=>{
        return new Promise((resolve, reject) => {
          // 获取图片
          const sqlimg = "select * from images where post_id=?";
          db.query(sqlimg, post.id, (err, images) => {
            if (err) reject(err);
            post.images = images; // 将图片添加到帖子中
              resolve(post)
          });  
        });  
        });
   
        Promise.all(postpromise).then(results => {   
          res.send({
            status: 0,
            message: "获取成功",
            data: results
          });
        })
    })
  }

  // 获取用户订单
  exports.getorderinfo=(req,res)=>{
 
    const sql='select * from order_goods where user_id=?'
    db.query(sql,req.auth.id,(err,results)=>{
      if (err) return res.cc(err);
      res.send({
        status: 0,
        message: "获取成功",
        data: results
      });
    })
  }