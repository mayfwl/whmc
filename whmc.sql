/*
 Navicat Premium Data Transfer

 Source Server         : whmc
 Source Server Type    : MySQL
 Source Server Version : 80019 (8.0.19)
 Source Host           : localhost:3306
 Source Schema         : whmc

 Target Server Type    : MySQL
 Target Server Version : 80019 (8.0.19)
 File Encoding         : 65001

 Date: 20/03/2024 22:08:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `people` int NULL DEFAULT NULL,
  `yid` int NULL DEFAULT NULL,
  `yname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `yid`(`yid` ASC) USING BTREE,
  CONSTRAINT `yid` FOREIGN KEY (`yid`) REFERENCES `trail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('奇幻杂技团', 120, '主要路线是从东门进去右手边，沿着大路一直到长江文明馆均有布置花灯，沿途有搭建布展，比较明显；尤其到了晚上，天黑开灯后，顺着有灯的路一直走就可以了。', 0, 3, '武汉园博园众乐苑露营', 'https://img0.baidu.com/it/u=1155708792,884668756&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=500');
INSERT INTO `activity` VALUES ('寻宝游戏', 123, '利用每个景点的线索找到下一个目的地，并挑战自己运用逻辑、想象力、观察力和团队精神来完成游戏。在探索时发现有关地区的信息。发现隐藏的线索。\r\n没有时间表，可以按照自己的节奏。\r\n作为一个团队工作或相互竞争。这是一项独特的团队建设活动，非常适合情侣、家庭、公司、学生和朋友团体。', 0, 9, '卓品行·露营', 'https://q-xx.bstatic.com/xdata/images/xphoto/max1200/313197845.jpg?k=3f388005f8724ea38c898bd19fa4c26b7449f5e65e62577b18820c88c966ca4a&o=');
INSERT INTO `activity` VALUES ('音频导览之旅', 125, '在这次带音频导览的自然之旅，你将在TravelMate应用程序的帮助下参观自然的亮点。在这次旅行，你将探索自然的景点，并了解城市的历史。\r\n你还将聆听音频指南，了解所经不同景点的信息。你可按照自己的节奏探索自然。', 0, 8, '开森营·武汉露营地', 'https://r-xx.bstatic.com/xdata/images/xphoto/max1200/115915047.jpg?k=3636bee87151f30ac0c73d2b46780e8019bacc33f6199c088ddf2a20281f8241&o=');
INSERT INTO `activity` VALUES ('烹饪课程和品尝美食', 180, '此次烹饪课程中，你将在一位热衷于当地菜系的家庭厨师的帮助下，探索美食艺术。在指导下，你将准备三道菜的当地菜肴，并学习一些技巧，回家以后也能重复制作这些美食。\r\n然后你可以坐下来享用餐点，并搭配红葡萄酒、白葡萄酒以及咖啡和水。', 0, 6, '大热荒野通用露营地', 'https://q-xx.bstatic.com/xdata/images/xphoto/max1200/313612321.jpg?k=a50a1f7f9739072b05cca4eb1150b6f4401b220ef2c77fa03fc21ee037a72fc0&o=');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '      ',
  `post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联动态的id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联到用户的id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户的名字',
  `user_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户图像',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1cd056d5-2b15-4ae0-8538-17f8aea1ebda', '6a19f116-e845-4088-89ab-08719aacaf25', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', 'adad', '2024-03-09');
INSERT INTO `comments` VALUES ('2dae1e69-4cd5-4476-8e2a-663cb1ad7d50', 'd5be8aec-d2be-40f4-959f-91ddd5d8c099', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', '222222', '2024-03-09');
INSERT INTO `comments` VALUES ('3b9df272-1a99-4bd1-a888-aea3a81ea332', '6a19f116-e845-4088-89ab-08719aacaf25', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', 'adadda', '2024-03-09');
INSERT INTO `comments` VALUES ('45d09def-e388-4126-ba9e-ce51b0fee99e', 'd5be8aec-d2be-40f4-959f-91ddd5d8c099', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', '111111', '2024-03-09');
INSERT INTO `comments` VALUES ('69332a14-5ddb-4d67-9838-9e9a5038b9dc', 'd5be8aec-d2be-40f4-959f-91ddd5d8c099', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', '123213', '2024-03-09');
INSERT INTO `comments` VALUES ('755a8a23-7067-4f20-9bc1-e0154fec64ef', '9aa71df9-19be-4654-9897-5c9766fd431b', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', '2222222222222', '2024-03-09');
INSERT INTO `comments` VALUES ('94f3323f-0f9c-4a3d-aa39-9fcab907a60c', '6a19f116-e845-4088-89ab-08719aacaf25', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', 'adad', '2024-03-09');
INSERT INTO `comments` VALUES ('a8d1c278-b45e-4570-b2a0-1d39afbc0954', '2f76379d-0462-43a9-b247-abecc8881ace', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', 'fafa', '2024-03-09');
INSERT INTO `comments` VALUES ('asdaf', '2f76379d-0462-43a9-b247-abecc8881ace', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', '1234', '2024-03-09');
INSERT INTO `comments` VALUES ('asdddhjfjhf', '2f76379d-0462-43a9-b247-abecc8881ace', '0f0482bc-c748-4132-827d-a5cd97d472c9', 'lyfq', 'https://api.multiavatar.com/1.png', '忆昔小雅u到达哈得好好大红大红的哈电话', '2024-03-13');
INSERT INTO `comments` VALUES ('asdddhjfjhfss', '2f76379d-0462-43a9-b247-abecc8881ace', '0f0482bc-c748-4132-827d-a5cd97d472c9', 'lyfq', 'https://api.multiavatar.com/2.pnghttps://api.multiavatar.com/3.png', '忆昔小雅u到达哈得好好大红大红的哈电话', '2024-03-13');
INSERT INTO `comments` VALUES ('b40a7211-2970-4977-8c4a-e08d171d4f62', '6a19f116-e845-4088-89ab-08719aacaf25', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', 'adad', '2024-03-09');
INSERT INTO `comments` VALUES ('d9664ac2-5399-4205-97c1-1ea660187160', '9cdd811e-dc3d-49d7-bc18-b9d93c877910', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', 'hao ', '2024-03-09');
INSERT INTO `comments` VALUES ('sss', '2f76379d-0462-43a9-b247-abecc8881ace', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 'https://api.multiavatar.com/1.png', '123', '2024-03-09');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`post_id` ASC) USING BTREE,
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1f21baed-fe9c-4850-b94c-810d420da410', '2f76379d-0462-43a9-b247-abecc8881ace', '/public/img/191709702999322.png');
INSERT INTO `images` VALUES ('45a86bb4-ae8c-45fe-827d-57ca3902813c', '05e9a401-acd3-4c36-b4e5-13fae9737dd4', '/public/img/141709883196815.png');
INSERT INTO `images` VALUES ('46662d12-d237-4eab-bc61-77fc7e437c09', '2f76379d-0462-43a9-b247-abecc8881ace', '/public/img/191709702999302.png');
INSERT INTO `images` VALUES ('491a31cc-7a61-47bd-9431-1f6fedc8a8c0', '224659e0-5ed7-4824-b74a-6bea8fb6a2fc', '/public/img/61709880983246.webp');
INSERT INTO `images` VALUES ('4c0a7e07-9e9f-4595-b0f9-2f886daaf9ae', 'dcfb59d1-eb81-43cf-8f0c-a27697fa31b3', '/public/img/61709880259696.jpeg');
INSERT INTO `images` VALUES ('525c1fce-7a19-4792-bf20-2a8a12c36d27', '9aa71df9-19be-4654-9897-5c9766fd431b', '/public/img/141709951043134.png');
INSERT INTO `images` VALUES ('5a89e94c-58cc-471a-8c79-30a9181d2387', '10345d22-783e-49a4-8d75-e9b1b7e5911d', '/public/img/61709880206807.jpeg');
INSERT INTO `images` VALUES ('6e2db31f-81d9-4b38-a73f-235942e42f05', '1c976578-8d97-49f5-881d-ce9134218135', '/public/img/141709881341388.png');
INSERT INTO `images` VALUES ('709a88c6-c524-4017-976c-0d20ee1a5e6b', '04c1a154-7eb1-455b-88cc-a2ded9c8b4a9', '/public/img/261709874811493.jpeg');
INSERT INTO `images` VALUES ('8233e9e8-d25a-492f-b434-d350eb8b8374', 'b72cc157-d617-4f57-98b3-c621adb14c8f', '/public/img/91709878676615.jpeg');
INSERT INTO `images` VALUES ('86ab4835-d9c6-47ec-8fff-d1f82ae70ee1', '563dd07a-7488-4327-86d8-52de7ee345c8', '/public/img/61709881074152.jpeg');
INSERT INTO `images` VALUES ('a561a6a5-c836-4104-ac2b-eb3e283925ec', 'd5be8aec-d2be-40f4-959f-91ddd5d8c099', '/public/img/61709880918724.webp');
INSERT INTO `images` VALUES ('acb177ee-eaf2-47b0-8d6a-cdf523f40894', '6a19f116-e845-4088-89ab-08719aacaf25', '/public/img/141709875290033.png');
INSERT INTO `images` VALUES ('bd72e57f-51c3-4d40-85d4-ff0ec1b6f2a8', '54f41c90-c81c-4861-b6fe-4aae36af266c', '/public/img/141709875744936.png');
INSERT INTO `images` VALUES ('c181dbc9-124a-4df4-8b85-61d015f99090', '6244f3c9-6347-4fd0-947f-656721efde0b', '/public/img/261709875154201.jpeg');
INSERT INTO `images` VALUES ('ccc33a9d-17f4-476a-9a40-d7bde7feb1f5', '9cdd811e-dc3d-49d7-bc18-b9d93c877910', '/public/img/61709878392563.webp');
INSERT INTO `images` VALUES ('d3313117-d991-46f7-b8b0-24330de1e876', '48432d91-400c-4682-946a-82340514b71a', '/public/img/141709874371989.png');
INSERT INTO `images` VALUES ('d635b4af-da0e-4d03-86da-77d79ee564b2', '7cee44cd-30ce-4f45-a164-95ab4b59f94f', '/public/img/141709884068600.png');
INSERT INTO `images` VALUES ('d8c46af4-8f1e-4f03-83a7-b0984e177ac3', 'ddeb3850-caeb-4941-a48a-9c09e04d9f57', '/public/img/141709881306252.png');
INSERT INTO `images` VALUES ('e7428d45-1209-471a-bb99-1419943ba60f', '48432d91-400c-4682-946a-82340514b71a', '/public/img/141709874371998.png');
INSERT INTO `images` VALUES ('eae79812-8975-4196-bb28-36178ac215f3', 'b0929155-1c73-4d88-a668-1d9ebd56895f', '/public/img/61709878439412.jpeg');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `posts_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '12',
  `posts_post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `posts_post_id`(`posts_post_id` ASC) USING BTREE,
  INDEX `posts_user_id`(`posts_user_id` ASC) USING BTREE,
  CONSTRAINT `posts_post_id` FOREIGN KEY (`posts_post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_user_id` FOREIGN KEY (`posts_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES ('269170ba-4eec-4284-94ee-037ae90c72c8', 'd620f169-55f6-4ffc-99ae-84470057e83c', '6a19f116-e845-4088-89ab-08719aacaf25');
INSERT INTO `likes` VALUES ('2e7036a4-8d2c-4a45-b3a2-c447965f55c4', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'd5be8aec-d2be-40f4-959f-91ddd5d8c099');
INSERT INTO `likes` VALUES ('338c85b1-48eb-4940-88d1-ccbbe41216b0', 'd620f169-55f6-4ffc-99ae-84470057e83c', '9aa71df9-19be-4654-9897-5c9766fd431b');
INSERT INTO `likes` VALUES ('78cbc615-dc70-4dbe-916a-606825731859', 'd620f169-55f6-4ffc-99ae-84470057e83c', '2f76379d-0462-43a9-b247-abecc8881ace');
INSERT INTO `likes` VALUES ('a168a273-88af-449e-9751-f7b97bb2a5e8', 'd620f169-55f6-4ffc-99ae-84470057e83c', '7cee44cd-30ce-4f45-a164-95ab4b59f94f');
INSERT INTO `likes` VALUES ('c3b1b9ea-823b-4590-8c98-d3fc1541746a', 'd620f169-55f6-4ffc-99ae-84470057e83c', '04c1a154-7eb1-455b-88cc-a2ded9c8b4a9');
INSERT INTO `likes` VALUES ('f4430efa-affc-4180-a68d-a995746852aa', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'b72cc157-d617-4f57-98b3-c621adb14c8f');

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trail_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '营地名字',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单用户留的姓名',
  `phone` bigint NULL DEFAULT NULL COMMENT '订单留下的手机号',
  `score` double UNSIGNED NULL DEFAULT NULL COMMENT '订单结束后用户可以进行打分',
  `son` int NULL DEFAULT NULL COMMENT '订单的价格',
  `trail_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单的图片',
  `perple` int NULL DEFAULT NULL COMMENT '订单参与的人数',
  `starttime` bigint NULL DEFAULT NULL COMMENT '开始的时间',
  `endtime` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `end` tinyint(1) NULL DEFAULT NULL COMMENT '订单是否完成',
  `act` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '活动的名字',
  `scores` double NULL DEFAULT NULL COMMENT '营地评分',
  `option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地区',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES ('14768d58-efa7-47ea-be9c-6fb393896407', '卓品行·露营', '李一塞西尔和', 17371215787, 0, 6, 'https://p0.meituan.net/dpmerchantpic/675182d3e6415b6a15c9844bc0d34db9429514.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 1, 1709802979363, 1709889379363, 0, '', 9.2, '江岸区', 'd620f169-55f6-4ffc-99ae-84470057e83c');
INSERT INTO `order_goods` VALUES ('1b4be1c9-6cc7-4f86-82a3-3c05df1f4411', '武汉园博园众乐苑露营', '李一塞西尔和', 17371215787, 0, 6, 'https://p0.meituan.net/poipicadd/4757de06ce9b9d714c53342178cb70a1189757.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 1, 1710259200000, 1710345600000, 1, '奇幻杂技团', 9.3, '江汉区', 'd620f169-55f6-4ffc-99ae-84470057e83c');
INSERT INTO `order_goods` VALUES ('55b1d6d5-6db9-4490-9341-086757e35cf1', '武汉园博园众乐苑露营', '李一塞西尔和', 17371215787, 0, 6, 'https://p0.meituan.net/poipicadd/4757de06ce9b9d714c53342178cb70a1189757.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 1, 1710259200000, 1710345600000, 0, '奇幻杂技团', 9.3, '江汉区', 'd620f169-55f6-4ffc-99ae-84470057e83c');
INSERT INTO `order_goods` VALUES ('5b463048-e8db-41e5-95ea-c4316e40da88', '武汉园博园众乐苑露营', '李一塞西尔和', 17371215787, 0, 6, 'https://p0.meituan.net/poipicadd/4757de06ce9b9d714c53342178cb70a1189757.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 1, 1710259200000, 1710345600000, 1, '奇幻杂技团', 9.3, '江汉区', 'd620f169-55f6-4ffc-99ae-84470057e83c');
INSERT INTO `order_goods` VALUES ('613f5cac-078b-42b3-b3b3-422d55b49528', 'OVERTIME·空中露营', '李一塞西尔和核心', 17371215787, 0, 6, 'https://p0.meituan.net/dpmerchantpic/48a07127b4a78eeca571d4743463136e46776.jpg%40240w_180h_1e_1c_1l%7Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', 1, 1709993080764, 1710079480764, 0, '', 9.2, '江汉区', 'd620f169-55f6-4ffc-99ae-84470057e83c');
INSERT INTO `order_goods` VALUES ('759c6b96-9df1-4568-ba58-01578fe78eb2', 'OVERTIME·空中露营', '李一塞西尔和', 17371215787, 0, 6, 'https://p0.meituan.net/dpmerchantpic/48a07127b4a78eeca571d4743463136e46776.jpg%40240w_180h_1e_1c_1l%7Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', 1, 1709780867000, 1709867267000, 0, '', 9.2, '江汉区', 'd620f169-55f6-4ffc-99ae-84470057e83c');
INSERT INTO `order_goods` VALUES ('a2be2bdb-ebe1-4dba-8f63-6a9a4db0b525', 'OVERTIME·空中露营', '李一塞西尔和', 17371215787, 0, 6, 'https://p0.meituan.net/dpmerchantpic/48a07127b4a78eeca571d4743463136e46776.jpg%40240w_180h_1e_1c_1l%7Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', 1, 1709603688541, 1709690088541, 1, '', 9.2, '江汉区', 'd620f169-55f6-4ffc-99ae-84470057e83c');
INSERT INTO `order_goods` VALUES ('aa6caa36-e0bf-4468-8321-393ee8ca0aa4', 'OVERTIME·空中露营', '李一塞西尔和', 17371215787, 0, 6, 'https://p0.meituan.net/dpmerchantpic/48a07127b4a78eeca571d4743463136e46776.jpg%40240w_180h_1e_1c_1l%7Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', 1, 1710314695314, 1710401095314, 0, '', 9.2, '江汉区', 'd620f169-55f6-4ffc-99ae-84470057e83c');
INSERT INTO `order_goods` VALUES ('e93b9426-e0cc-425f-9aac-08eb17b3a0c4', '武汉园博园众乐苑露营', '李一塞西尔和', 17371215787, 0, 6, 'https://p0.meituan.net/poipicadd/4757de06ce9b9d714c53342178cb70a1189757.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 1, 1710259200000, 1710345600000, 0, '奇幻杂技团', 9.3, '江汉区', 'd620f169-55f6-4ffc-99ae-84470057e83c');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `constent` varchar(9000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布文本内容',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布人名字',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布人id',
  `user_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布人图像',
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布时间',
  `like` int UNSIGNED NULL DEFAULT 0 COMMENT '点赞数',
  `option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('04c1a154-7eb1-455b-88cc-a2ded9c8b4a9', 'qqqqqq', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '洪山区');
INSERT INTO `posts` VALUES ('05e9a401-acd3-4c36-b4e5-13fae9737dd4', '11111111', '111111111', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '111111111');
INSERT INTO `posts` VALUES ('10345d22-783e-49a4-8d75-e9b1b7e5911d', '12', '22', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '22');
INSERT INTO `posts` VALUES ('1c976578-8d97-49f5-881d-ce9134218135', '66666666666', '66666', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '666666');
INSERT INTO `posts` VALUES ('224659e0-5ed7-4824-b74a-6bea8fb6a2fc', '12333333', '333', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '333');
INSERT INTO `posts` VALUES ('2f76379d-0462-43a9-b247-abecc8881ace', 'qqq', 'www', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月06日（三）', 0, 'www');
INSERT INTO `posts` VALUES ('48432d91-400c-4682-946a-82340514b71a', '一一一愿意', '说明书上没什么没什么说嘛说嘛说嘛水妈妈是吗是吗没撒是吗没撒', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '江夏区');
INSERT INTO `posts` VALUES ('54f41c90-c81c-4861-b6fe-4aae36af266c', '2131', 'wr2131311\r\n1\r\n11\r\n1\r\n1\r\n\r\n1\r\n1\r\n1', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, 'qbl');
INSERT INTO `posts` VALUES ('563dd07a-7488-4327-86d8-52de7ee345c8', '32', '32', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '32');
INSERT INTO `posts` VALUES ('6244f3c9-6347-4fd0-947f-656721efde0b', '11', '22', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, 'sss');
INSERT INTO `posts` VALUES ('6a19f116-e845-4088-89ab-08719aacaf25', 'good', 'jhea jsaoj  skah s jlas jl sal sal jlaj \r\nsadkja \r\nsdjl j  sksakssa\r\nks ks \r\nsakddddddddddddddddddddddddddddddddddddd', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '孝感');
INSERT INTO `posts` VALUES ('7cee44cd-30ce-4f45-a164-95ab4b59f94f', '1234567809', '1234567809', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '1234567809');
INSERT INTO `posts` VALUES ('9aa71df9-19be-4654-9897-5c9766fd431b', 'asdfssssssss', 'asdf', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月09日（六）', 0, 'adsssss');
INSERT INTO `posts` VALUES ('9cdd811e-dc3d-49d7-bc18-b9d93c877910', '12345', '12345', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '12345');
INSERT INTO `posts` VALUES ('b0929155-1c73-4d88-a668-1d9ebd56895f', '234', '234', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '324');
INSERT INTO `posts` VALUES ('b72cc157-d617-4f57-98b3-c621adb14c8f', '123', '23', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '222');
INSERT INTO `posts` VALUES ('d5be8aec-d2be-40f4-959f-91ddd5d8c099', '098', '098', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '098');
INSERT INTO `posts` VALUES ('dcfb59d1-eb81-43cf-8f0c-a27697fa31b3', '123', '123', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '123');
INSERT INTO `posts` VALUES ('ddeb3850-caeb-4941-a48a-9c09e04d9f57', '111111', '11111111', 'lyfs', 'd620f169-55f6-4ffc-99ae-84470057e83c', 'https://api.multiavatar.com/1.png', '03月08日（五）', 0, '1111');

-- ----------------------------
-- Table structure for trail
-- ----------------------------
DROP TABLE IF EXISTS `trail`;
CREATE TABLE `trail`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '营地 名字',
  `option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区域（洪山区等)',
  `x` decimal(13, 6) NULL DEFAULT NULL COMMENT '位置x坐标',
  `y` decimal(13, 6) NULL DEFAULT NULL COMMENT '位置y坐标',
  `optype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型（湖边，草原等）',
  `himg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主题图片',
  `scor` double NULL DEFAULT NULL COMMENT '评分',
  `act` int NULL DEFAULT NULL COMMENT '活动',
  `son` int NULL DEFAULT NULL COMMENT '价格',
  `enname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trail
-- ----------------------------
INSERT INTO `trail` VALUES (1, 'OVERTIME·空中露营', '江汉区', 114.268573, 30.612218, '江边', 'https://p0.meituan.net/dpmerchantpic/48a07127b4a78eeca571d4743463136e46776.jpg%40240w_180h_1e_1c_1l%7Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', 9.2, 0, 129, 'OVERTIME · Aerial camping', '青年路江宸天街B座35楼3508室');
INSERT INTO `trail` VALUES (2, '野奢露营', '江汉区', 114.297596, 30.584644, '稻田', 'https://p0.meituan.net/dpmerchantpic/f18602ec082e7c7d6bd07734080ce6e9324953.png%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 8.5, 0, 98, 'Wild luxury camping', '中山大道818号');
INSERT INTO `trail` VALUES (3, '武汉园博园众乐苑露营', '江汉区', 114.229324, 30.624210, '花园，草地', 'https://p0.meituan.net/poipicadd/4757de06ce9b9d714c53342178cb70a1189757.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 9.3, 1, 0, 'Wuhan Garden Expo Park zhongle Garden', '\r\n园博会（园博园地铁站B1口步行420米）');
INSERT INTO `trail` VALUES (4, '向往的生活·乡野', '蔡甸区', 113.991053, 30.441898, '花园，草地', 'https://p0.meituan.net/dpmerchantpic/f400ae10549a50d1897d1317f66ea31f608584.jpg%40240w_180h_1e_1c_1l%7Cwatermark%3D1%26%26r%3D1%26p%3D9%26x%3D2%26y%3D2%26relative%3D1%26o%3D20', 7.2, 0, 0, 'Yearning for the life · countryside', '花楼街·中央荣御2楼C区');
INSERT INTO `trail` VALUES (5, '中山公园', '江汉区', 114.277733, 30.592775, '花园，草地', 'https://p0.meituan.net/hoteltdc/565bb9917e5849d946f27a9b2258b8131704490.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 9.8, 0, 0, 'Zhongshan Park', '解放大道1265号（武汉协和医院武广武展地铁2号线）');
INSERT INTO `trail` VALUES (6, '大热荒野通用露营地', '江汉区', 114.269405, 30.596053, '花园，草地', '	https://poi-pic.cdn.bcebos.com/9a5f297b7cd0764f52d73328842bd56a.jpg', 7.2, 1, 150, 'Hot Hot Wilderness Universal Campground', '\r\n建设大道538号');
INSERT INTO `trail` VALUES (7, 'Love·freedom室内露营', '江汉区', 114.299486, 30.582177, '室内体验', '	https://lbsugc.cdn.bcebos.com/images/B6088102f2e7a940f4.jpeg', 9.2, 0, 125, 'Love·freedo Indoor', '卓刀泉街道\r\n卓刀泉街道\r\n卓刀泉街道');
INSERT INTO `trail` VALUES (8, '开森营·武汉露营地', '江岸区', 114.285416, 30.595289, '花园，草原', 'https://p0.meituan.net/dpmerchantpic/ba13f6bfd3248339f8c16590016ad9db672745.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 9.8, 1, 199, 'Kaisheng Camp · Wuhan Campsite', '江汉北路34号九运大厦C单元20层1室');
INSERT INTO `trail` VALUES (9, '卓品行·露营', '江岸区', 114.312086, 30.646570, '湖边', 'https://p0.meituan.net/dpmerchantpic/675182d3e6415b6a15c9844bc0d34db9429514.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 9.2, 1, 259, 'Zhuo conduct', '\r\n后湖街道鑫零点餐饮管理有限公司湖北省武汉市江岸区淌湖三村306号(兴业路地铁站B口步行270米)\r\n\r\n后湖街道鑫零点餐饮管理有限公司湖北省武汉市江岸区淌湖三村306号(兴业路地铁站B口步行270米)\r\n后湖街道鑫零点餐饮管理有限公司湖北省武汉市江岸区淌湖三村306号');
INSERT INTO `trail` VALUES (10, '营地第九局', '江岸区', 114.240838, 30.558572, '花园，草原', 'https://p0.meituan.net/dpmerchantpic/747e02920947217ea9eb40ea067a97eb624413.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 7.5, 0, 198, 'Camp 9th inning', '街道口鹏程蕙园1栋503');
INSERT INTO `trail` VALUES (11, '府河郊野公园', '江岸区', 114.307929, 30.677027, '花园，草原', 'https://p0.meituan.net/hoteltdc/6189294996d411c18f49fa5ee23585311276116.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 9.1, 0, 0, 'Fuhe Country Park', 'S1岱黄高速东100米');
INSERT INTO `trail` VALUES (12, '解放公园', '江岸区', 114.304546, 30.614185, '湖边', 'https://p0.meituan.net/ugcpic/c67af4930714507e11f7e9b91c6ecb8a%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 9.1, 0, 0, 'Liberation park', '解放大道1861号\r\n解放大道1861号\r\n解放大道1861号');
INSERT INTO `trail` VALUES (13, 'Camping Tomorrow露营俱乐部', '武昌区', 114.340240, 30.594268, '花园，草原', 'https://p0.meituan.net/dpmerchantpic/dec1c72b2b52011c180723b43d51871a60958.jpg%40340w_255h_1e_1c_1l%7Cwatermark%3D0', 9.5, 0, 109, 'Camping Tomorrow Camping Club', '新长江滨江花园7-1-602');
INSERT INTO `trail` VALUES (14, '荒野露营', '黄陂区', 114.339312, 31.201484, '花园，草地', 'https://t10.baidu.com/it/u=728872009,204468886&fm=30&app=106&f=JPEG?w=640&h=480&s=DDB00CD3863A538CD03729780300903A', 8.6, 0, 120, 'Wilderness Universal Campground', '武汉市黄陂区黄陂木兰文化生态旅游区');
INSERT INTO `trail` VALUES (15, '\r\n趣野露营·小森营地', '蔡甸区', 113.998352, 30.506004, '湖边', 'https://img1.baidu.com/it/u=3962604097,331280122&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1067', 9.2, 0, 130, 'Quye camping · Komori Camp', '湖北省武汉市蔡甸区');

-- ----------------------------
-- Table structure for trailimg
-- ----------------------------
DROP TABLE IF EXISTS `trailimg`;
CREATE TABLE `trailimg`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trail_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `trail_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `trail_id`(`trail_id` ASC) USING BTREE,
  CONSTRAINT `trail_id` FOREIGN KEY (`trail_id`) REFERENCES `trail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trailimg
-- ----------------------------
INSERT INTO `trailimg` VALUES ('af1', 'https://img1.baidu.com/it/u=3024714875,2863912765&fm=253&fmt=auto&app=138&f=JPEG?w=751&h=500', 8);
INSERT INTO `trailimg` VALUES ('af2', 'https://img1.baidu.com/it/u=2755859578,1330443035&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=668', 8);
INSERT INTO `trailimg` VALUES ('af3', 'https://img0.baidu.com/it/u=2699695468,911810120&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 8);
INSERT INTO `trailimg` VALUES ('af4', 'https://img1.baidu.com/it/u=3019381336,141155251&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 8);
INSERT INTO `trailimg` VALUES ('as1', 'https://img2.baidu.com/it/u=3080901262,614030809&fm=253&fmt=auto&app=138&f=JPEG?w=888&h=500', 1);
INSERT INTO `trailimg` VALUES ('as2', 'https://img2.baidu.com/it/u=2708517130,2041275101&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=336', 1);
INSERT INTO `trailimg` VALUES ('as3', 'https://img2.baidu.com/it/u=1302387187,861708018&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=668', 1);
INSERT INTO `trailimg` VALUES ('as4', 'https://img1.baidu.com/it/u=2298644921,4142496210&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', 1);
INSERT INTO `trailimg` VALUES ('df1', 'https://img2.baidu.com/it/u=3630687167,83667464&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', 7);
INSERT INTO `trailimg` VALUES ('df2', 'https://img0.baidu.com/it/u=2409543095,1201358169&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', 7);
INSERT INTO `trailimg` VALUES ('df3', 'https://img0.baidu.com/it/u=2378967677,604812956&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', 7);
INSERT INTO `trailimg` VALUES ('df4', 'https://img1.baidu.com/it/u=1515682179,3640119045&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667', 7);
INSERT INTO `trailimg` VALUES ('er1', 'https://img0.baidu.com/it/u=3133730189,3888774581&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=334', 4);
INSERT INTO `trailimg` VALUES ('er2', 'https://img0.baidu.com/it/u=2267392771,219129643&fm=253&fmt=auto&app=138&f=JPEG?w=751&h=500', 4);
INSERT INTO `trailimg` VALUES ('er3', 'https://img1.baidu.com/it/u=1706932054,1379555460&fm=253&fmt=auto&app=138&f=JPEG?w=749&h=500', 4);
INSERT INTO `trailimg` VALUES ('er4', 'https://img2.baidu.com/it/u=3126013744,799339259&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', 4);
INSERT INTO `trailimg` VALUES ('nm', '	https://img1.baidu.com/it/u=3749099282,2391692382&fm=253&fmt=auto&app=138&f=JPEG?w=751&h=500', 12);
INSERT INTO `trailimg` VALUES ('nm2', 'https://img2.baidu.com/it/u=118569501,1346355020&fm=253&fmt=auto&app=120&f=JPEG?w=660&h=445', 12);
INSERT INTO `trailimg` VALUES ('nm3', '	https://img2.baidu.com/it/u=2941563343,4087845320&fm=253&fmt=auto&app=138&f=JPEG?w=741&h=500', 12);
INSERT INTO `trailimg` VALUES ('nm4', 'https://img1.baidu.com/it/u=1270731774,3073967945&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 12);
INSERT INTO `trailimg` VALUES ('op1', '	https://img0.baidu.com/it/u=3728298199,2436832729&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 11);
INSERT INTO `trailimg` VALUES ('op2', 'https://img1.baidu.com/it/u=4082258116,2074160893&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 11);
INSERT INTO `trailimg` VALUES ('op3', 'https://img0.baidu.com/it/u=3984373643,2655907890&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 11);
INSERT INTO `trailimg` VALUES ('op4', 'https://img1.baidu.com/it/u=3354444791,2494205452&fm=253&fmt=auto&app=138&f=JPEG?w=978&h=500', 11);
INSERT INTO `trailimg` VALUES ('qq1', '	https://img1.baidu.com/it/u=49062499,1750252666&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500', 13);
INSERT INTO `trailimg` VALUES ('qq2', 'https://img2.baidu.com/it/u=1740568723,4082043902&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 13);
INSERT INTO `trailimg` VALUES ('qq3', '	https://img1.baidu.com/it/u=571505248,4227267280&fm=253&fmt=auto&app=138&f=JPEG?w=708&h=500', 13);
INSERT INTO `trailimg` VALUES ('qq4', 'https://img2.baidu.com/it/u=1721478797,369017943&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 13);
INSERT INTO `trailimg` VALUES ('qw1', 'https://img1.baidu.com/it/u=2323197686,2943821837&fm=253&fmt=auto&app=120&f=JPEG?w=660&h=420', 2);
INSERT INTO `trailimg` VALUES ('qw2', 'https://img1.baidu.com/it/u=3503629581,2480033955&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=448', 2);
INSERT INTO `trailimg` VALUES ('qw3', 'https://img2.baidu.com/it/u=292879488,2886659256&fm=253&fmt=auto&app=138&f=JPEG?w=640&h=310', 2);
INSERT INTO `trailimg` VALUES ('qw4', 'https://img1.baidu.com/it/u=4060786597,1989630558&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800', 2);
INSERT INTO `trailimg` VALUES ('sd1', 'https://img1.baidu.com/it/u=3419478541,3489443408&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 5);
INSERT INTO `trailimg` VALUES ('sd2', 'https://img1.baidu.com/it/u=1824899932,868395035&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', 5);
INSERT INTO `trailimg` VALUES ('sd3', 'https://img1.baidu.com/it/u=1824899932,868395035&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', 5);
INSERT INTO `trailimg` VALUES ('sd4', 'https://img2.baidu.com/it/u=118569501,1346355020&fm=253&fmt=auto&app=120&f=JPEG?w=660&h=445', 5);
INSERT INTO `trailimg` VALUES ('ty1', 'https://img0.baidu.com/it/u=4133522785,2760164019&fm=253&fmt=auto&app=120&f=JPEG?w=640&h=425', 9);
INSERT INTO `trailimg` VALUES ('ty2', 'https://img1.baidu.com/it/u=267347735,837327997&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 9);
INSERT INTO `trailimg` VALUES ('ty3', 'https://img1.baidu.com/it/u=3211690198,2190595109&fm=253&fmt=auto&app=138&f=JPEG?w=704&h=500', 9);
INSERT INTO `trailimg` VALUES ('ty4', 'https://img0.baidu.com/it/u=2139962985,3046462593&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', 9);
INSERT INTO `trailimg` VALUES ('we1', 'https://img0.baidu.com/it/u=1579949611,2564561577&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', 3);
INSERT INTO `trailimg` VALUES ('we2', 'https://img2.baidu.com/it/u=1213203496,2803797883&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 3);
INSERT INTO `trailimg` VALUES ('we3', 'https://img0.baidu.com/it/u=340086680,3773942770&fm=253&fmt=auto&app=138&f=JPEG?w=576&h=380', 3);
INSERT INTO `trailimg` VALUES ('we4', 'https://img2.baidu.com/it/u=1763132439,2007455223&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500', 3);
INSERT INTO `trailimg` VALUES ('zc1', 'https://img0.baidu.com/it/u=3418699790,554309655&fm=253&fmt=auto&app=120&f=JPEG?w=665&h=455', 10);
INSERT INTO `trailimg` VALUES ('zc2', '	https://img2.baidu.com/it/u=525479864,2193752450&fm=253&fmt=auto&app=138&f=JPEG?w=640&h=398', 10);
INSERT INTO `trailimg` VALUES ('zc3', 'ttps://img1.baidu.com/it/u=1316174754,2381522586&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', 10);
INSERT INTO `trailimg` VALUES ('zc4', 'https://img1.baidu.com/it/u=3654198844,1565497239&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333', 10);
INSERT INTO `trailimg` VALUES ('zx1', 'https://img2.baidu.com/it/u=2905715469,3457448967&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666', 6);
INSERT INTO `trailimg` VALUES ('zx2', 'https://img0.baidu.com/it/u=789254377,2079289036&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 6);
INSERT INTO `trailimg` VALUES ('zx3', 'https://img1.baidu.com/it/u=1205170642,3991992528&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500', 6);
INSERT INTO `trailimg` VALUES ('zx4', 'https://img2.baidu.com/it/u=820780635,1650403189&fm=253&fmt=auto&app=120&f=JPEG?w=722&h=500', 6);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` bigint NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'https://api.multiavatar.com/1.png' COMMENT '图像',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '暂无更多内容' COMMENT '个人介绍',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0f0482bc-c748-4132-827d-a5cd97d472c9', 'lyfq', 12345678988, '$2a$10$jmcXi9BnyjK/VO7ZfknzOOhmWaKY2lOFjVC9VD3S3RD/K6aevGnmi', 'https://api.multiavatar.com/1.png', '暂无更多内容');
INSERT INTO `user` VALUES ('d620f169-55f6-4ffc-99ae-84470057e83c', 'lyfs', 12345678999, '$2a$10$MFuM23zgmpVB6CjJ97nQQueFDOSlUwugObWTC7ZcDVbyJienJ/HL.', 'https://api.multiavatar.com/6.png', '大四，长得帅');

SET FOREIGN_KEY_CHECKS = 1;
