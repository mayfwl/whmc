// 动态的操作
// 导入数据库模块
const db = require("../db/index");

// 为生成一个id
const { v4: uuidv4 } = require('uuid');
function generateUserId() {
    // Generate a random UUID.
    const id = uuidv4();
  
    // Return the generated ID.
    return id;
  }
// 发布一个动态
exports.uploadPosts = (req, res) => {
  // 获取文件路径
  const files = req.files;
  const filePaths = files.map(file => `${file.path.replace(/\\/g, '/').replace('D:/作业/whmc/whmc/', '/')}`);
 
  const posts_id = generateUserId();
  const sql = "insert into posts set ?";
 
  // 将第一个数据库查询包装在一个 promise 中
  const insertPostPromise = new Promise((resolve, reject) => {
     db.query(sql, { ...req.body, id: posts_id }, (err, results) => {
       if (err) reject(err);
       resolve(results);
     });
  });
 
  // 将第二个数据库查询包装在一个 promise 中
  const insertImagesPromise = new Promise((resolve, reject) => {
     const sqlstr = "insert into images (id,post_id,path) VALUES ?";
     const values = filePaths.map(filePath => [generateUserId(), posts_id, filePath]);
 
     db.query(sqlstr, [values], (err, results) => {
       if (err) reject(err);
       resolve(results);
     });
  });
 
  // 使用 Promise.all 等待两个 promise 解析
  Promise.all([insertPostPromise, insertImagesPromise])
     .then(results => {
       res.send({
         status: 0,
         message: "发布成功",
         data: results
       });
     })
     .catch(err => {
       res.cc(err);
     });
 };


//   获取所有的动态
  exports.getPosts = (req, res) => {
    let posts
    const sql = "select * from posts";
    db.query(sql, (err, results) => {
      if (err) return res.cc(err);
    
     posts=results
     const postpromise= posts.map(post=>{
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
})}

exports.getComments=(req,res)=>{

  const sql='select * from comments where post_id=?'
  db.query(sql,req.query.id,(err,results)=>{
    if (err) return res.cc(err);
    res.send({
      status: 0,
      message: "获取成功",
      data: results
    });
  })
}

exports.createComment=(req,res)=>{
  const sql='insert into comments set ?'
  const id=generateUserId()
const coom={...req.body,id}
  db.query(sql,coom,(err,results)=>{
    if (err) return res.cc(err);
    res.send({
      status: 0,
      message: "评论成功",
      data: results
    });
  })
}

// 是否点赞
exports.getlike=(req,res)=>{
  const sql='select * from likes where posts_post_id=? and posts_user_id=?'
  db.query(sql,[req.body.posts_post_id,req.body.posts_user_id],(err,results)=>{
    if (err) return res.cc(err);
    if(results.length==0){
      res.send({
        status: 0,
        message: "未点赞",
        data: false
      });
    }else{
      res.send({
        status: 0,
        message: "点赞",
        data: true
      });
    }
    
  })
}

// 点赞人数
exports.likeman=(req,res)=>{
  const sql='select count(*) as count from likes where posts_post_id=?'
  db.query(sql,req.body.posts_post_id,(err,results)=>{
    if (err) return res.cc(err);

    res.send({
      status: 0,
      message: "获取成功",
      data: results
    });
  })
}

// 点赞
exports.like=(req,res)=>{
  const sql='insert into likes set ?'
  const id=generateUserId()
  const like={...req.body,id}
  db.query(sql,like,(err,results)=>{
    if (err) return res.cc(err);
    res.send({
      status: 0,
      message: "点赞成功",
      data: results
    });
  })
}

// 取消点赞
exports.unlike=(req,res)=>{
  const sql='delete from likes where posts_post_id=? and posts_user_id=?'
  db.query(sql,[req.body.posts_post_id,req.body.posts_user_id],(err,results)=>{
    if (err) return res.cc(err);
    res.send({
      status: 0,
      message: "取消点赞成功",
      data: results
    });
  })
}

// 用户点赞作品
exports.userlike=(req,res)=>{
  const sql='select * from likes where posts_user_id=?'
  db.query(sql,req.query.id,(err,results)=>{
 
    if (err) return res.cc(err);
    res.send({
      status: 0,
      message: "获取成功",
      data: results
    });
  })
}

// 用户作品
exports.userposts=(req,res)=>{
  const sql='select * from posts where user_id=?'
  db.query(sql,req.query.id,(err,results)=>{
    if (err) return res.cc(err);
    res.send({
      status: 0,
      message: "获取成功",
      data: results
    });
  })
}