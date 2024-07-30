/*
 Navicat Premium Data Transfer

 Source Server         : web-test
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : nothing

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 12/07/2024 09:53:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员表序号',
  `user_id` int NOT NULL COMMENT '对应用户表用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1);
INSERT INTO `admin` VALUES (10, 3);
INSERT INTO `admin` VALUES (18, 59);
INSERT INTO `admin` VALUES (19, 60);
INSERT INTO `admin` VALUES (20, 61);

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `id` int NOT NULL COMMENT '签到表id对应user_id',
  `time` datetime NULL DEFAULT NULL COMMENT '签到日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES (1, '2024-07-12 00:00:00');
INSERT INTO `attendance` VALUES (58, '2024-07-11 00:00:00');
INSERT INTO `attendance` VALUES (60, '2024-07-12 00:00:00');
INSERT INTO `attendance` VALUES (61, '2024-07-12 00:00:00');

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '作者表序号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者笔名',
  `user_id` int NOT NULL COMMENT '对应用户表用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES (6, '林桜', 6);
INSERT INTO `author` VALUES (7, '近藤美羽', 7);
INSERT INTO `author` VALUES (8, '上田葉月', 8);
INSERT INTO `author` VALUES (9, '武田凛', 9);
INSERT INTO `author` VALUES (10, '石田架純', 10);
INSERT INTO `author` VALUES (11, '菊地陽菜', 11);
INSERT INTO `author` VALUES (12, '木下翼', 12);
INSERT INTO `author` VALUES (13, '中森百花', 13);
INSERT INTO `author` VALUES (14, '橋本美月', 14);
INSERT INTO `author` VALUES (15, '新井七海', 15);
INSERT INTO `author` VALUES (16, '佐々木結翔', 16);
INSERT INTO `author` VALUES (17, '島田愛梨', 17);
INSERT INTO `author` VALUES (18, '宮崎花', 18);
INSERT INTO `author` VALUES (19, '阿部光', 19);
INSERT INTO `author` VALUES (20, '内田美月', 20);
INSERT INTO `author` VALUES (21, '岡本美羽', 21);
INSERT INTO `author` VALUES (22, '中川明菜', 22);
INSERT INTO `author` VALUES (23, '山本蒼士', 23);
INSERT INTO `author` VALUES (24, '渡部絢斗', 24);
INSERT INTO `author` VALUES (25, '坂本美緒', 25);
INSERT INTO `author` VALUES (26, '横山花', 26);
INSERT INTO `author` VALUES (27, '中森絢斗', 27);
INSERT INTO `author` VALUES (28, '近藤聖子', 28);
INSERT INTO `author` VALUES (29, '大塚大地', 29);
INSERT INTO `author` VALUES (30, '小野健太', 30);
INSERT INTO `author` VALUES (31, '西村和真', 31);
INSERT INTO `author` VALUES (32, '阿部七海', 32);
INSERT INTO `author` VALUES (33, '森聖子', 33);
INSERT INTO `author` VALUES (34, '金子湊', 34);
INSERT INTO `author` VALUES (35, '中川聖子', 35);
INSERT INTO `author` VALUES (36, '酒井蒼士', 36);
INSERT INTO `author` VALUES (37, '斉藤光', 37);
INSERT INTO `author` VALUES (38, '青木絢斗', 38);
INSERT INTO `author` VALUES (39, '新井翼', 39);
INSERT INTO `author` VALUES (40, '松井海斗', 40);
INSERT INTO `author` VALUES (41, '村上光莉', 41);
INSERT INTO `author` VALUES (42, '岡田涼太', 42);
INSERT INTO `author` VALUES (43, '柴田大輔', 43);
INSERT INTO `author` VALUES (44, '小川愛梨', 44);
INSERT INTO `author` VALUES (45, '木村百花', 45);
INSERT INTO `author` VALUES (46, '坂本大輔', 46);
INSERT INTO `author` VALUES (47, '阿部美羽', 47);
INSERT INTO `author` VALUES (49, '小林聖子', 49);
INSERT INTO `author` VALUES (62, '韩立小子', 1);
INSERT INTO `author` VALUES (63, '哈哈哈哈', 60);
INSERT INTO `author` VALUES (64, '作者', 61);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '书的序号',
  `book_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书名',
  `classification` int NOT NULL COMMENT '分类，联查分类表',
  `author` int NOT NULL COMMENT '书的作者序号',
  `publisher` int NOT NULL COMMENT '发行商，联查发行商表',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书的简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (8, 'Cherry pi', 4, 7, 2, 'suKqiKsjUX');
INSERT INTO `book` VALUES (10, 'ultra-Maogo', 5, 6, 2, 'IcbtnsNkPE');
INSERT INTO `book` VALUES (11, 'Orange core', 1, 6, 1, 'P6YMA1QYpJ');
INSERT INTO `book` VALUES (20, 'hango premium', 2, 10, 1, '3qg392Dw5r');
INSERT INTO `book` VALUES (22, 'Ikeda Itsuki', 6, 8, 1, 'l4EhHrRXds');
INSERT INTO `book` VALUES (23, 'Yamashita Sara', 3, 39, 1, 'AFiPnqPmdi');
INSERT INTO `book` VALUES (24, 'Liao Zhennan', 2, 48, 1, 'LAyu36uMXj');
INSERT INTO `book` VALUES (25, 'Guo Yuning', 2, 17, 2, 'btSrLyfXdQ');
INSERT INTO `book` VALUES (26, 'Jamie Roberts', 3, 25, 2, 'avyxQWh3xK');
INSERT INTO `book` VALUES (27, 'Robert Hernandez', 4, 12, 2, 'sX18fkrPmY');
INSERT INTO `book` VALUES (28, 'Laura Long', 3, 42, 1, 'wzK2Rsw5zk');
INSERT INTO `book` VALUES (29, 'Arimura Yota', 5, 31, 1, 'tR9xcbvdzP');
INSERT INTO `book` VALUES (30, 'Lu Jiehong', 5, 17, 1, 'dTrTUlJVOB');
INSERT INTO `book` VALUES (31, 'Kathryn Reyes', 5, 35, 2, 'uLtdchJMxJ');
INSERT INTO `book` VALUES (32, 'Song Ziyi', 1, 31, 2, 'mj9y14ZrLa');
INSERT INTO `book` VALUES (33, 'Elizabeth Stevens', 2, 15, 1, 'i8rrv8W4uB');
INSERT INTO `book` VALUES (34, 'Liao Yu Ling', 5, 13, 2, 'WhoBu8I5hC');
INSERT INTO `book` VALUES (35, 'Kikuchi Yuna', 5, 28, 2, 'lRNanQgr1K');
INSERT INTO `book` VALUES (36, 'Yang Jiehong', 5, 33, 2, 'r6YDr7gle4');
INSERT INTO `book` VALUES (37, 'Vincent Holmes', 2, 39, 2, 'B02FIb08EG');
INSERT INTO `book` VALUES (38, 'Lu Yuning', 4, 45, 2, 'zBACwK0ofi');
INSERT INTO `book` VALUES (39, 'Ito Yuto', 2, 17, 2, 'ZgQVBWPz0M');
INSERT INTO `book` VALUES (40, 'Lo Kwok Kuen', 2, 24, 2, 'PyLEnI4zLD');
INSERT INTO `book` VALUES (41, 'He Xiuying', 5, 47, 2, 'g4FvsxdfiV');
INSERT INTO `book` VALUES (42, 'Kato Hikaru', 1, 43, 1, 'HMzMMpXA1D');
INSERT INTO `book` VALUES (43, 'Inoue Sara', 4, 10, 1, 'm6fbGFjZtc');
INSERT INTO `book` VALUES (44, 'Gary Nichols', 6, 34, 1, 'Ei3WIJj6mX');
INSERT INTO `book` VALUES (45, 'Wan Sum Wing', 3, 21, 2, 'miAKlErDdI');
INSERT INTO `book` VALUES (46, 'Yeow Sze Kwan', 2, 16, 2, '0LBngM95kd');
INSERT INTO `book` VALUES (47, 'Stephen Watson', 4, 23, 1, 'wqgbdAlJmX');
INSERT INTO `book` VALUES (48, 'Yip On Kay', 4, 8, 2, 'BfsrYmhWbV');
INSERT INTO `book` VALUES (49, 'Cao Yunxi', 4, 45, 2, 'UeddTMgyKn');
INSERT INTO `book` VALUES (50, 'Chung Tsz Ching', 6, 36, 1, '7ul1N744g0');
INSERT INTO `book` VALUES (51, 'Yamada Airi', 5, 35, 2, 'jfebY0Pr13');
INSERT INTO `book` VALUES (52, 'Ti Sau Man', 3, 40, 2, '356vzUwD1A');
INSERT INTO `book` VALUES (53, 'Hashimoto Momoka', 2, 10, 1, 'AQjC2fETPf');
INSERT INTO `book` VALUES (54, 'Gloria Phillips', 4, 8, 1, 'ywqGQ4neKc');
INSERT INTO `book` VALUES (55, 'Francis Hicks', 4, 45, 2, 'fx9Tl6MqMf');
INSERT INTO `book` VALUES (56, 'Lo Wai Lam', 4, 38, 1, 'ur9eG4g1OH');
INSERT INTO `book` VALUES (57, 'Yung Wai Yee', 1, 43, 1, 'ojLMCFwLDB');
INSERT INTO `book` VALUES (58, 'Lok Wing Kuen', 4, 40, 1, 'Lo2VNl0c4b');
INSERT INTO `book` VALUES (59, 'Cheryl Schmidt', 5, 25, 1, 'ghdhKkKOOj');
INSERT INTO `book` VALUES (60, 'Yuan Xiaoming', 3, 28, 1, 'CEmpTqjEZr');
INSERT INTO `book` VALUES (61, 'Fung Tak Wah', 3, 21, 2, 'GopclJHn7Z');
INSERT INTO `book` VALUES (62, 'Zhu Rui', 4, 43, 1, 'zyJfji8XWx');
INSERT INTO `book` VALUES (63, 'Lu Zitao', 5, 46, 2, 'TRcFVVOfL2');
INSERT INTO `book` VALUES (64, 'Qian Lan', 4, 30, 1, 'xKP5AOMJdo');
INSERT INTO `book` VALUES (65, 'Nomura Yuna', 4, 16, 2, 'vNvxXmnN5t');
INSERT INTO `book` VALUES (66, 'Harada Akina', 4, 12, 2, 'D3BlKS3nsf');
INSERT INTO `book` VALUES (67, 'Lo Hui Mei', 2, 9, 1, '8QSmGb6qtI');
INSERT INTO `book` VALUES (68, 'Debbie Harris', 3, 43, 1, 'XqWVsxTQxb');
INSERT INTO `book` VALUES (69, 'Yamashita Ikki', 2, 41, 1, 'cATRmmfMyY');
INSERT INTO `book` VALUES (70, 'Yoshida Minato', 2, 41, 2, 'VUUtVUYSDq');
INSERT INTO `book` VALUES (71, 'Shing Kwok Kuen', 2, 24, 1, 'js2s2cCFvW');
INSERT INTO `book` VALUES (72, '我的中专人生', 2, 62, 2, '啊，我的中专人生！');
INSERT INTO `book` VALUES (73, '为什么我的代码跑不了？', 6, 62, 1, '各种报红？');
INSERT INTO `book` VALUES (75, '论鸭血粉丝', 3, 62, 2, '我爱鸭血粉丝！！！！！！！！！！！');
INSERT INTO `book` VALUES (76, '书名', 4, 64, 1, '介绍');

-- ----------------------------
-- Table structure for card_balance
-- ----------------------------
DROP TABLE IF EXISTS `card_balance`;
CREATE TABLE `card_balance`  (
  `id` int NOT NULL COMMENT '抽卡奖励积分id',
  `balance` double(10, 2) NOT NULL COMMENT '抽卡积分数量',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '卡面图片url',
  `level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '卡面等级',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '卡面名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of card_balance
-- ----------------------------
INSERT INTO `card_balance` VALUES (1, 10.00, 'https://web-heaven-tlias.oss-cn-beijing.aliyuncs.com/172071757519030cffdd15ab3e3ca59280e3da170cb91fc5e.png', 'B', '10积分');
INSERT INTO `card_balance` VALUES (2, 100.00, 'https://web-heaven-tlias.oss-cn-beijing.aliyuncs.com/172071755386809bc8754dc3d3ef53a12241d3ef29f263e5e.png', 'A', '100积分');
INSERT INTO `card_balance` VALUES (3, 1000.00, 'https://web-heaven-tlias.oss-cn-beijing.aliyuncs.com/17207175571549d7bb882e1364a98df09a6517f00a63fe1d1.jpg', 'S', '1000积分');

-- ----------------------------
-- Table structure for card_type
-- ----------------------------
DROP TABLE IF EXISTS `card_type`;
CREATE TABLE `card_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '抽卡奖励类型id',
  `card_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽卡类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of card_type
-- ----------------------------
INSERT INTO `card_type` VALUES (1, 'balance');

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `classification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classification
-- ----------------------------
INSERT INTO `classification` VALUES (1, '悬疑');
INSERT INTO `classification` VALUES (2, '冒险');
INSERT INTO `classification` VALUES (3, '爱情');
INSERT INTO `classification` VALUES (4, '玄幻');
INSERT INTO `classification` VALUES (5, '武侠');
INSERT INTO `classification` VALUES (6, '推理');

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend`  (
  `send` int NOT NULL COMMENT '好友中一方id',
  `receive` int NOT NULL COMMENT '好友中另一方id',
  `state` tinyint NOT NULL COMMENT '好友状态，0待接受，1为好友'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES (1, 59, 1);
INSERT INTO `friend` VALUES (59, 1, 1);
INSERT INTO `friend` VALUES (60, 1, 1);
INSERT INTO `friend` VALUES (1, 60, 1);
INSERT INTO `friend` VALUES (59, 60, 1);
INSERT INTO `friend` VALUES (60, 59, 1);
INSERT INTO `friend` VALUES (58, 61, 1);
INSERT INTO `friend` VALUES (61, 58, 1);
INSERT INTO `friend` VALUES (58, 1, 0);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '消息序号id',
  `send` int NOT NULL COMMENT '发送方id',
  `receive` int NOT NULL COMMENT '接收方id',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发送消息',
  `time` datetime NOT NULL COMMENT '发送时间',
  `state` tinyint NOT NULL COMMENT '消息状态，0未读，1已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 371 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (310, 59, 1, '6', '2024-07-11 11:09:29', 1);
INSERT INTO `message` VALUES (311, 59, 1, '88', '2024-07-11 11:09:45', 1);
INSERT INTO `message` VALUES (312, 59, 1, '555', '2024-07-11 11:10:09', 1);
INSERT INTO `message` VALUES (313, 59, 1, '888', '2024-07-11 11:10:16', 1);
INSERT INTO `message` VALUES (314, 59, 1, '88', '2024-07-11 11:11:02', 1);
INSERT INTO `message` VALUES (315, 59, 1, '888', '2024-07-11 11:13:03', 1);
INSERT INTO `message` VALUES (316, 59, 1, '666', '2024-07-11 11:17:06', 1);
INSERT INTO `message` VALUES (317, 59, 1, '222', '2024-07-11 11:17:09', 1);
INSERT INTO `message` VALUES (318, 59, 1, '333', '2024-07-11 11:17:13', 1);
INSERT INTO `message` VALUES (319, 59, 1, '666', '2024-07-11 11:19:06', 1);
INSERT INTO `message` VALUES (320, 59, 1, '8', '2024-07-11 11:20:06', 1);
INSERT INTO `message` VALUES (321, 59, 1, '666', '2024-07-11 11:26:04', 1);
INSERT INTO `message` VALUES (322, 59, 1, '22', '2024-07-11 11:26:07', 1);
INSERT INTO `message` VALUES (323, 1, 59, 'awrawr', '2024-07-11 11:26:19', 1);
INSERT INTO `message` VALUES (324, 1, 59, 'asds', '2024-07-11 11:26:24', 1);
INSERT INTO `message` VALUES (325, 1, 59, 'daw4gwg', '2024-07-11 11:26:32', 1);
INSERT INTO `message` VALUES (326, 1, 59, 'awtawt', '2024-07-11 11:26:44', 1);
INSERT INTO `message` VALUES (327, 1, 59, 'S', '2024-07-11 11:26:52', 1);
INSERT INTO `message` VALUES (328, 1, 59, 'DWADAWD', '2024-07-11 11:27:13', 1);
INSERT INTO `message` VALUES (329, 1, 59, 'dd', '2024-07-11 11:27:41', 1);
INSERT INTO `message` VALUES (331, 59, 0, '99', '2024-07-11 12:21:39', 0);
INSERT INTO `message` VALUES (332, 59, 0, '111', '2024-07-11 12:21:43', 0);
INSERT INTO `message` VALUES (333, 59, 0, '', '2024-07-11 12:21:43', 0);
INSERT INTO `message` VALUES (335, 59, 0, '222', '2024-07-11 12:21:52', 0);
INSERT INTO `message` VALUES (336, 59, 0, '555', '2024-07-11 12:22:11', 0);
INSERT INTO `message` VALUES (337, 59, 0, '222', '2024-07-11 12:22:17', 0);
INSERT INTO `message` VALUES (339, 59, 0, '33', '2024-07-11 12:22:20', 0);
INSERT INTO `message` VALUES (340, 59, 0, '3', '2024-07-11 12:22:21', 0);
INSERT INTO `message` VALUES (341, 59, 0, '3', '2024-07-11 12:22:21', 0);
INSERT INTO `message` VALUES (342, 59, 0, '3', '2024-07-11 12:22:21', 0);
INSERT INTO `message` VALUES (343, 59, 0, '3', '2024-07-11 12:22:22', 0);
INSERT INTO `message` VALUES (344, 59, 0, '3', '2024-07-11 12:22:22', 0);
INSERT INTO `message` VALUES (345, 59, 0, '3', '2024-07-11 12:22:22', 0);
INSERT INTO `message` VALUES (346, 59, 0, '3', '2024-07-11 12:22:22', 0);
INSERT INTO `message` VALUES (347, 59, 0, '3', '2024-07-11 12:22:23', 0);
INSERT INTO `message` VALUES (348, 59, 0, '3', '2024-07-11 12:22:23', 0);
INSERT INTO `message` VALUES (350, 59, 0, '33', '2024-07-11 12:22:26', 0);
INSERT INTO `message` VALUES (351, 59, 0, '3', '2024-07-11 12:22:26', 0);
INSERT INTO `message` VALUES (352, 59, 0, '', '2024-07-11 12:22:26', 0);
INSERT INTO `message` VALUES (353, 59, 0, '3', '2024-07-11 12:22:26', 0);
INSERT INTO `message` VALUES (354, 59, 0, '', '2024-07-11 12:22:26', 0);
INSERT INTO `message` VALUES (355, 59, 0, '3', '2024-07-11 12:22:26', 0);
INSERT INTO `message` VALUES (356, 59, 0, '3', '2024-07-11 12:22:27', 0);
INSERT INTO `message` VALUES (357, 59, 0, '3', '2024-07-11 12:22:27', 0);
INSERT INTO `message` VALUES (358, 59, 0, '3', '2024-07-11 12:22:27', 0);
INSERT INTO `message` VALUES (359, 59, 0, '33', '2024-07-11 12:22:28', 0);
INSERT INTO `message` VALUES (360, 58, 61, '吃粑粑', '2024-07-11 14:08:54', 1);
INSERT INTO `message` VALUES (361, 58, 61, '6', '2024-07-11 14:09:03', 1);
INSERT INTO `message` VALUES (362, 58, 61, '66', '2024-07-11 14:09:03', 1);
INSERT INTO `message` VALUES (363, 58, 0, '吃粑粑', '2024-07-11 14:09:13', 0);
INSERT INTO `message` VALUES (364, 61, 58, '？？？', '2024-07-11 15:41:05', 1);
INSERT INTO `message` VALUES (369, 61, 58, '？', '2024-07-12 09:25:22', 0);
INSERT INTO `message` VALUES (370, 61, 58, '？', '2024-07-12 09:25:23', 0);

-- ----------------------------
-- Table structure for money
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '钱包序号',
  `user_id` int NOT NULL COMMENT '与用户表对应',
  `balance` double(10, 2) NULL DEFAULT NULL COMMENT '用户余额',
  PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES (62, 62, 0.00);
INSERT INTO `money` VALUES (61, 61, 66669202.31);
INSERT INTO `money` VALUES (60, 60, 6206.31);
INSERT INTO `money` VALUES (59, 59, 0.00);
INSERT INTO `money` VALUES (58, 58, 5011.45);
INSERT INTO `money` VALUES (57, 57, 0.00);
INSERT INTO `money` VALUES (56, 56, 0.00);
INSERT INTO `money` VALUES (55, 55, 0.00);
INSERT INTO `money` VALUES (54, 54, 0.00);
INSERT INTO `money` VALUES (53, 53, 0.00);
INSERT INTO `money` VALUES (52, 52, 0.00);
INSERT INTO `money` VALUES (51, 51, 0.00);
INSERT INTO `money` VALUES (50, 50, 563.65);
INSERT INTO `money` VALUES (49, 49, 880.06);
INSERT INTO `money` VALUES (48, 48, 485.05);
INSERT INTO `money` VALUES (47, 47, 927.26);
INSERT INTO `money` VALUES (46, 46, 662.50);
INSERT INTO `money` VALUES (45, 45, 135.80);
INSERT INTO `money` VALUES (44, 44, 399.74);
INSERT INTO `money` VALUES (43, 43, 116.50);
INSERT INTO `money` VALUES (42, 42, 510.80);
INSERT INTO `money` VALUES (41, 41, 5.53);
INSERT INTO `money` VALUES (40, 40, 90.56);
INSERT INTO `money` VALUES (39, 39, 375.82);
INSERT INTO `money` VALUES (38, 38, 412.35);
INSERT INTO `money` VALUES (37, 37, 819.57);
INSERT INTO `money` VALUES (36, 36, 103.11);
INSERT INTO `money` VALUES (35, 35, 271.49);
INSERT INTO `money` VALUES (34, 34, 127.37);
INSERT INTO `money` VALUES (33, 33, 196.19);
INSERT INTO `money` VALUES (32, 32, 881.95);
INSERT INTO `money` VALUES (31, 31, 733.76);
INSERT INTO `money` VALUES (30, 30, 466.51);
INSERT INTO `money` VALUES (29, 29, 562.75);
INSERT INTO `money` VALUES (28, 28, 648.77);
INSERT INTO `money` VALUES (27, 27, 822.40);
INSERT INTO `money` VALUES (26, 26, 906.58);
INSERT INTO `money` VALUES (25, 25, 987.63);
INSERT INTO `money` VALUES (24, 24, 305.02);
INSERT INTO `money` VALUES (23, 23, 816.54);
INSERT INTO `money` VALUES (22, 22, 274.81);
INSERT INTO `money` VALUES (21, 21, 815.98);
INSERT INTO `money` VALUES (20, 20, 909.90);
INSERT INTO `money` VALUES (19, 19, 994.14);
INSERT INTO `money` VALUES (18, 18, 770.18);
INSERT INTO `money` VALUES (17, 17, 179.22);
INSERT INTO `money` VALUES (16, 16, 42.64);
INSERT INTO `money` VALUES (15, 15, 379.80);
INSERT INTO `money` VALUES (14, 14, 420.00);
INSERT INTO `money` VALUES (13, 13, 462.28);
INSERT INTO `money` VALUES (12, 12, 72.96);
INSERT INTO `money` VALUES (11, 11, 664.80);
INSERT INTO `money` VALUES (10, 10, 686.71);
INSERT INTO `money` VALUES (9, 9, 385.82);
INSERT INTO `money` VALUES (8, 8, 166.14);
INSERT INTO `money` VALUES (7, 7, 726.76);
INSERT INTO `money` VALUES (6, 6, 445.45);
INSERT INTO `money` VALUES (5, 5, 735.89);
INSERT INTO `money` VALUES (4, 4, 667.76);
INSERT INTO `money` VALUES (3, 3, 324.01);
INSERT INTO `money` VALUES (2, 2, 479.17);
INSERT INTO `money` VALUES (1, 1, 24582.41);

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `operate_user` int UNSIGNED NULL DEFAULT NULL COMMENT '操作人ID',
  `operate_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作的类名',
  `method_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作的方法名',
  `method_params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法参数',
  `return_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '返回值',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '方法执行耗时, 单位:ms',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1098 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of operate_log
-- ----------------------------
INSERT INTO `operate_log` VALUES (871, 1, '2024-07-11 14:32:12', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 16);
INSERT INTO `operate_log` VALUES (872, 1, '2024-07-11 14:33:58', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (873, 61, '2024-07-11 14:35:19', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[61]', 'null', 1);
INSERT INTO `operate_log` VALUES (874, 59, '2024-07-11 14:35:40', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[59]', 'null', 0);
INSERT INTO `operate_log` VALUES (875, 59, '2024-07-11 14:36:44', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[59]', 'null', 1);
INSERT INTO `operate_log` VALUES (876, 59, '2024-07-11 14:40:44', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[59]', 'null', 2);
INSERT INTO `operate_log` VALUES (877, 61, '2024-07-11 14:40:44', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[61]', 'null', 1);
INSERT INTO `operate_log` VALUES (878, 59, '2024-07-11 14:40:44', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[59]', 'null', 3);
INSERT INTO `operate_log` VALUES (879, 1, '2024-07-11 14:40:44', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (880, 1, '2024-07-11 14:40:53', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (881, 1, '2024-07-11 14:45:17', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'update', '[Author(id=1, name=巴巴爸爸, user_id=0)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (882, 1, '2024-07-11 14:45:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'update', '[Author(id=1, name=韩立, user_id=0)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (883, 1, '2024-07-11 14:45:54', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'update', '[Author(id=1, name=韩立小子, user_id=0)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (884, 1, '2024-07-11 14:46:01', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (885, 1, '2024-07-11 14:46:46', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (886, 1, '2024-07-11 14:48:41', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[1, 韩立]', '{\"code\":1,\"data\":\"成为作者成功\",\"msg\":\"success\"}', 6);
INSERT INTO `operate_log` VALUES (887, 1, '2024-07-11 14:48:50', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'update', '[Author(id=1, name=韩立小子, user_id=0)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (888, 1, '2024-07-11 14:50:02', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (889, 1, '2024-07-11 14:53:52', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (890, 61, '2024-07-11 15:01:18', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[61]', 'null', 0);
INSERT INTO `operate_log` VALUES (891, 59, '2024-07-11 15:01:18', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[59]', 'null', 1);
INSERT INTO `operate_log` VALUES (892, 1, '2024-07-11 15:02:58', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (893, 1, '2024-07-11 15:09:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (894, 1, '2024-07-11 15:09:41', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'update', '[Author(id=1, name=韩立小子, user_id=0)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (895, 1, '2024-07-11 15:14:28', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'update', '[Author(id=1, name=韩立小子, user_id=0)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 0);
INSERT INTO `operate_log` VALUES (896, 1, '2024-07-11 15:25:28', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 6);
INSERT INTO `operate_log` VALUES (897, 1, '2024-07-11 15:26:02', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (898, 1, '2024-07-11 15:26:35', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (899, 1, '2024-07-11 15:32:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'update', '[Author(id=1, name=韩立小子, user_id=0)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (900, 1, '2024-07-11 15:32:29', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'update', '[Author(id=1, name=韩立小子, user_id=0)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 0);
INSERT INTO `operate_log` VALUES (901, 61, '2024-07-11 15:37:17', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[61]', 'null', 1);
INSERT INTO `operate_log` VALUES (902, 61, '2024-07-11 15:41:05', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'sendMsg', '[ChatMsg(id=null, send=61, receive=58, msg=？？？, time=null, state=null)]', '{\"code\":1,\"data\":\"消息发送成功\",\"msg\":\"success\"}', 5);
INSERT INTO `operate_log` VALUES (903, 1, '2024-07-11 15:46:35', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'update', '[Author(id=1, name=韩立小子, user_id=0)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (904, 61, '2024-07-11 15:51:13', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[61]', 'null', 1);
INSERT INTO `operate_log` VALUES (905, 59, '2024-07-11 16:00:06', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'addBook', '[Book(id=null, book_name=666, author=cindybur, classification=武侠, publisher=扬州江都职教, intro=MsXzYOydXR)]', '{\"code\":1,\"data\":\"添加成功\",\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (906, 1, '2024-07-11 16:00:51', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'addBook', '[Book(id=1, book_name=我的中专人生, author=韩立小子, classification=冒险, publisher=江都职教, intro=啊，我的中专人生！)]', '{\"code\":1,\"data\":\"添加成功\",\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (907, 1, '2024-07-11 16:00:55', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (908, 1, '2024-07-11 16:01:21', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'addBook', '[Book(id=1, book_name=我的中专人生, author=韩立小子, classification=冒险, publisher=江都职教, intro=我的中专人生！)]', '{\"code\":1,\"data\":\"添加成功\",\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (909, 59, '2024-07-11 16:02:05', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'addBook', '[Book(id=null, book_name=666, author=cindybur, classification=武侠, publisher=扬州江都职教, intro=MsXzYOydXR)]', '{\"code\":1,\"data\":\"添加成功\",\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (910, 1, '2024-07-11 16:02:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'addBook', '[Book(id=1, book_name=我的中专人生, author=韩立小子, classification=冒险, publisher=扬州江都职教, intro=我的中专人生！)]', '{\"code\":1,\"data\":\"添加成功\",\"msg\":\"success\"}', 4);
INSERT INTO `operate_log` VALUES (911, 1, '2024-07-11 16:02:48', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (912, 61, '2024-07-11 16:03:34', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[61]', 'null', 1);
INSERT INTO `operate_log` VALUES (913, 59, '2024-07-11 16:08:22', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[59]', 'null', 1);
INSERT INTO `operate_log` VALUES (914, 61, '2024-07-11 16:08:22', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[61]', 'null', 1);
INSERT INTO `operate_log` VALUES (915, 1, '2024-07-11 16:08:22', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (916, 1, '2024-07-11 16:09:18', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'addBook', '[Book(id=1, book_name=为什么我的代码跑不了？, author=韩立小子, classification=推理, publisher=武汉理工大学, intro=各种报红？)]', '{\"code\":1,\"data\":\"添加成功\",\"msg\":\"success\"}', 6);
INSERT INTO `operate_log` VALUES (917, 1, '2024-07-11 16:12:13', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 4);
INSERT INTO `operate_log` VALUES (918, 1, '2024-07-11 16:13:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (919, 1, '2024-07-11 16:34:19', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'updateBook', '[Book(id=1, book_name=我的中专人生, author=韩立小子, classification=冒险, publisher=扬州江都职教, intro=啊，我的中专人生！)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 4);
INSERT INTO `operate_log` VALUES (920, 1, '2024-07-11 16:34:27', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (921, 1, '2024-07-11 16:34:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'updateBook', '[Book(id=1, book_name=我的中专人生, author=韩立小子, classification=冒险, publisher=扬州江都职教, intro=啊，我的中专人生！)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (922, 1, '2024-07-11 16:36:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'updateBook', '[Book(id=1, book_name=我的中专人生, author=韩立小子, classification=冒险, publisher=扬州江都职教, intro=啊，我的中专人生！)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 19);
INSERT INTO `operate_log` VALUES (923, 1, '2024-07-11 16:39:53', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'updateBook', '[Book(id=72, book_name=我的中专人生, author=韩立小子, classification=冒险, publisher=扬州江都职教, intro=啊，我的中专人生！)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 7);
INSERT INTO `operate_log` VALUES (924, 1, '2024-07-11 16:42:01', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'addBook', '[Book(id=1, book_name=asdas, author=韩立小子, classification=悬疑, publisher=武汉理工大学, intro=sdasd)]', '{\"code\":1,\"data\":\"添加成功\",\"msg\":\"success\"}', 5);
INSERT INTO `operate_log` VALUES (925, 1, '2024-07-11 16:42:04', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'deleteBook', '[[74]]', '{\"code\":1,\"data\":\"删除成功\",\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (926, 1, '2024-07-11 17:08:43', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 16);
INSERT INTO `operate_log` VALUES (927, 1, '2024-07-11 17:09:11', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (928, 59, '2024-07-11 17:13:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[59]', 'null', 0);
INSERT INTO `operate_log` VALUES (929, 62, '2024-07-11 17:16:04', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[62]', 'null', 0);
INSERT INTO `operate_log` VALUES (930, 1, '2024-07-11 17:18:26', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 20);
INSERT INTO `operate_log` VALUES (931, 1, '2024-07-11 17:18:45', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (932, 59, '2024-07-11 17:18:45', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[59]', 'null', 1);
INSERT INTO `operate_log` VALUES (933, 59, '2024-07-11 17:23:29', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[59]', 'null', 2);
INSERT INTO `operate_log` VALUES (934, 1, '2024-07-11 17:23:30', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 15);
INSERT INTO `operate_log` VALUES (935, 1, '2024-07-11 17:43:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'addBook', '[Book(id=1, book_name=论鸭血粉丝, author=韩立小子, classification=爱情, publisher=扬州江都职教, intro=我爱鸭血粉丝！！！！！！！！！！！)]', '{\"code\":1,\"data\":\"添加成功\",\"msg\":\"success\"}', 7);
INSERT INTO `operate_log` VALUES (936, 1, '2024-07-11 17:43:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendAccept', '[1, 58]', '{\"code\":1,\"data\":\"接受好友成功\",\"msg\":\"success\"}', 6);
INSERT INTO `operate_log` VALUES (937, 1, '2024-07-11 17:43:39', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (938, 1, '2024-07-11 19:18:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (939, 1, '2024-07-11 19:22:08', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 2);
INSERT INTO `operate_log` VALUES (940, 1, '2024-07-11 19:25:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (941, 1, '2024-07-11 19:28:04', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (942, 1, '2024-07-11 19:28:57', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 2);
INSERT INTO `operate_log` VALUES (943, 1, '2024-07-11 19:38:11', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (944, 1, '2024-07-11 19:41:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (945, 1, '2024-07-11 19:43:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (946, 1, '2024-07-11 19:51:40', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (947, 1, '2024-07-11 19:54:09', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (948, 1, '2024-07-11 19:54:27', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (949, 1, '2024-07-11 19:56:58', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 3);
INSERT INTO `operate_log` VALUES (950, 1, '2024-07-11 20:02:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (951, 1, '2024-07-11 20:03:33', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (952, 1, '2024-07-11 20:05:32', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (953, 1, '2024-07-11 20:08:42', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (954, 1, '2024-07-11 20:25:43', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (955, 1, '2024-07-11 20:31:33', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (956, 1, '2024-07-11 20:42:21', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'updateBook', '[Book(id=73, book_name=为什么我的代码跑不了？, author=韩立小子, classification=推理, publisher=扬州江都职教, intro=各种报红？)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 5);
INSERT INTO `operate_log` VALUES (957, 1, '2024-07-11 20:42:24', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'updateBook', '[Book(id=73, book_name=为什么我的代码跑不了？, author=韩立小子, classification=推理, publisher=武汉理工大学, intro=各种报红？)]', '{\"code\":1,\"data\":\"更新成功\",\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (958, 58, '2024-07-11 20:42:54', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (959, 58, '2024-07-11 20:43:32', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (960, 58, '2024-07-11 20:44:17', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (961, 58, '2024-07-11 20:46:17', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (962, 58, '2024-07-11 20:46:40', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[58, wdaw]', '{\"code\":0,\"data\":\"你太穷了\",\"msg\":\"error\"}', 2);
INSERT INTO `operate_log` VALUES (963, 58, '2024-07-11 20:47:04', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'sendMsg', '[ChatMsg(id=null, send=58, receive=1, msg=在？, time=null, state=null)]', '{\"code\":1,\"data\":\"消息发送成功\",\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (964, 58, '2024-07-11 20:47:18', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[58, ee]', '{\"code\":0,\"data\":\"你太穷了\",\"msg\":\"error\"}', 1);
INSERT INTO `operate_log` VALUES (965, 58, '2024-07-11 20:47:19', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[58, ee]', '{\"code\":0,\"data\":\"你太穷了\",\"msg\":\"error\"}', 1);
INSERT INTO `operate_log` VALUES (966, 58, '2024-07-11 20:47:20', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[58, ee]', '{\"code\":0,\"data\":\"你太穷了\",\"msg\":\"error\"}', 1);
INSERT INTO `operate_log` VALUES (967, 58, '2024-07-11 20:47:20', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[58, ee]', '{\"code\":0,\"data\":\"你太穷了\",\"msg\":\"error\"}', 1);
INSERT INTO `operate_log` VALUES (968, 58, '2024-07-11 20:47:20', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[58, ee]', '{\"code\":0,\"data\":\"你太穷了\",\"msg\":\"error\"}', 1);
INSERT INTO `operate_log` VALUES (969, 58, '2024-07-11 20:47:29', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[58, dwdw]', '{\"code\":0,\"data\":\"你太穷了\",\"msg\":\"error\"}', 1);
INSERT INTO `operate_log` VALUES (970, 58, '2024-07-11 20:48:27', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[58, dawdwa]', '{\"code\":0,\"data\":\"你太穷了\",\"msg\":\"error\"}', 1);
INSERT INTO `operate_log` VALUES (971, 58, '2024-07-11 20:57:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (972, 58, '2024-07-11 21:12:06', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (973, 58, '2024-07-11 21:57:15', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 2);
INSERT INTO `operate_log` VALUES (974, 1, '2024-07-11 21:57:21', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (975, 1, '2024-07-11 21:57:29', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'sendMsg', '[ChatMsg(id=null, send=1, receive=58, msg=哈哈哈, time=null, state=null)]', '{\"code\":1,\"data\":\"消息发送成功\",\"msg\":\"success\"}', 7);
INSERT INTO `operate_log` VALUES (976, 1, '2024-07-11 21:59:49', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (977, 1, '2024-07-11 22:00:28', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (978, 1, '2024-07-11 22:14:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (979, 1, '2024-07-11 22:15:00', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (980, 1, '2024-07-11 22:17:55', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (981, 1, '2024-07-11 22:18:32', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (982, 1, '2024-07-11 22:19:04', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (983, 1, '2024-07-11 22:19:41', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (984, 1, '2024-07-11 22:20:10', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (985, 1, '2024-07-11 22:21:39', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (986, 1, '2024-07-11 22:22:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (987, 1, '2024-07-11 22:23:10', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (988, 1, '2024-07-11 22:24:33', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (989, 1, '2024-07-11 22:24:55', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (990, 1, '2024-07-11 22:26:16', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (991, 1, '2024-07-11 22:26:33', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (992, 1, '2024-07-11 22:27:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (993, 1, '2024-07-11 22:28:04', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (994, 1, '2024-07-11 22:29:51', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (995, 1, '2024-07-11 22:30:21', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (996, 1, '2024-07-11 22:30:58', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (997, 1, '2024-07-11 22:31:47', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (998, 1, '2024-07-11 22:36:32', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (999, 1, '2024-07-11 22:39:47', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1000, 1, '2024-07-11 22:39:57', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1001, 1, '2024-07-11 22:41:00', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1002, 1, '2024-07-11 22:47:57', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1003, 1, '2024-07-11 22:58:34', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1004, 1, '2024-07-11 23:11:45', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1005, 1, '2024-07-11 23:26:37', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1006, 1, '2024-07-11 23:27:05', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1007, 1, '2024-07-11 23:29:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1008, 1, '2024-07-11 23:50:04', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1009, 1, '2024-07-11 23:51:19', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1010, 1, '2024-07-11 23:56:31', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1011, 1, '2024-07-11 23:57:11', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1012, 1, '2024-07-12 00:04:02', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1013, 1, '2024-07-12 00:10:58', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 2);
INSERT INTO `operate_log` VALUES (1014, 1, '2024-07-12 00:12:31', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1015, 1, '2024-07-12 00:15:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1016, 1, '2024-07-12 00:16:01', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1017, 1, '2024-07-12 00:20:42', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1018, 1, '2024-07-12 00:40:13', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1019, 1, '2024-07-12 00:49:08', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1020, 1, '2024-07-12 01:08:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1021, 1, '2024-07-12 01:22:45', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1022, 1, '2024-07-12 01:26:49', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1023, 1, '2024-07-12 01:28:18', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1024, 1, '2024-07-12 01:31:32', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1025, 1, '2024-07-12 02:03:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1026, 1, '2024-07-12 02:03:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1027, 1, '2024-07-12 02:04:09', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1028, 1, '2024-07-12 02:04:56', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1029, 1, '2024-07-12 02:11:24', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1030, 1, '2024-07-12 02:29:58', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1031, 1, '2024-07-12 08:05:51', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1032, 1, '2024-07-12 08:05:57', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1033, 1, '2024-07-12 08:06:02', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1034, 1, '2024-07-12 08:06:04', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1035, 1, '2024-07-12 08:06:05', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 2);
INSERT INTO `operate_log` VALUES (1036, 1, '2024-07-12 08:06:09', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1037, 1, '2024-07-12 08:06:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 2);
INSERT INTO `operate_log` VALUES (1038, 1, '2024-07-12 08:06:44', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 3);
INSERT INTO `operate_log` VALUES (1039, 1, '2024-07-12 08:14:20', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1040, 1, '2024-07-12 08:32:38', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 3);
INSERT INTO `operate_log` VALUES (1041, 60, '2024-07-12 08:43:29', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[60]', 'null', 1);
INSERT INTO `operate_log` VALUES (1042, 60, '2024-07-12 08:59:25', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[60, 哈哈哈哈]', '{\"code\":1,\"data\":\"成为作者成功\",\"msg\":\"success\"}', 5);
INSERT INTO `operate_log` VALUES (1043, 1, '2024-07-12 08:59:41', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1044, 61, '2024-07-12 09:03:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[61]', 'null', 0);
INSERT INTO `operate_log` VALUES (1045, 1, '2024-07-12 09:09:59', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1046, 61, '2024-07-12 09:19:44', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[61]', 'null', 0);
INSERT INTO `operate_log` VALUES (1047, 1, '2024-07-12 09:19:44', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1048, 1, '2024-07-12 09:21:13', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendDelete', '[1, 0]', '{\"code\":1,\"data\":\"删除成功\",\"msg\":\"success\"}', 5);
INSERT INTO `operate_log` VALUES (1049, 1, '2024-07-12 09:21:13', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1050, 1, '2024-07-12 09:21:16', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1051, 1, '2024-07-12 09:21:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendDelete', '[1, 0]', '{\"code\":1,\"data\":\"删除成功\",\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (1052, 1, '2024-07-12 09:21:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1053, 1, '2024-07-12 09:22:07', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendDelete', '[1, 58]', '{\"code\":1,\"data\":\"删除成功\",\"msg\":\"success\"}', 5);
INSERT INTO `operate_log` VALUES (1054, 1, '2024-07-12 09:22:07', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1055, 1, '2024-07-12 09:22:20', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'sendMsg', '[ChatMsg(id=null, send=1, receive=58, msg=aw, time=null, state=null)]', '{\"code\":1,\"data\":\"消息发送成功\",\"msg\":\"success\"}', 4);
INSERT INTO `operate_log` VALUES (1056, 58, '2024-07-12 09:22:33', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (1057, 58, '2024-07-12 09:22:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendMake', '[58, 111]', '{\"code\":1,\"data\":\"好友请求发送成功\",\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (1058, 58, '2024-07-12 09:22:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (1059, 58, '2024-07-12 09:22:36', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (1060, 1, '2024-07-12 09:22:40', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (1061, 1, '2024-07-12 09:23:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendAccept', '[1, 58]', '{\"code\":1,\"data\":\"接受好友成功\",\"msg\":\"success\"}', 5);
INSERT INTO `operate_log` VALUES (1062, 1, '2024-07-12 09:23:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1063, 1, '2024-07-12 09:23:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1064, 1, '2024-07-12 09:23:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1065, 1, '2024-07-12 09:23:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1066, 61, '2024-07-12 09:23:16', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'beAuthor', '[61, 作者]', '{\"code\":1,\"data\":\"成为作者成功\",\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (1067, 1, '2024-07-12 09:23:17', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendDelete', '[1, 58]', '{\"code\":1,\"data\":\"删除成功\",\"msg\":\"success\"}', 7);
INSERT INTO `operate_log` VALUES (1068, 1, '2024-07-12 09:23:17', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1069, 61, '2024-07-12 09:23:43', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'addBook', '[Book(id=61, book_name=书名, author=作者, classification=玄幻, publisher=武汉理工大学, intro=介绍)]', '{\"code\":1,\"data\":\"添加成功\",\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (1070, 58, '2024-07-12 09:24:03', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (1071, 58, '2024-07-12 09:24:05', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendMake', '[58, 111]', '{\"code\":1,\"data\":\"好友请求发送成功\",\"msg\":\"success\"}', 4);
INSERT INTO `operate_log` VALUES (1072, 58, '2024-07-12 09:24:05', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (1073, 58, '2024-07-12 09:24:05', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (1074, 58, '2024-07-12 09:24:05', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (1075, 58, '2024-07-12 09:24:05', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (1076, 1, '2024-07-12 09:24:10', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (1077, 1, '2024-07-12 09:24:12', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendAccept', '[1, 58]', '{\"code\":1,\"data\":\"接受好友成功\",\"msg\":\"success\"}', 5);
INSERT INTO `operate_log` VALUES (1078, 1, '2024-07-12 09:24:12', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1079, 1, '2024-07-12 09:24:12', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1080, 1, '2024-07-12 09:24:12', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 0);
INSERT INTO `operate_log` VALUES (1081, 1, '2024-07-12 09:24:12', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1082, 1, '2024-07-12 09:24:12', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1083, 1, '2024-07-12 09:24:12', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1084, 1, '2024-07-12 09:24:14', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'sendMsg', '[ChatMsg(id=null, send=1, receive=58, msg=dawd, time=null, state=null)]', '{\"code\":1,\"data\":\"消息发送成功\",\"msg\":\"success\"}', 6);
INSERT INTO `operate_log` VALUES (1085, 1, '2024-07-12 09:24:16', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendDelete', '[1, 58]', '{\"code\":1,\"data\":\"删除成功\",\"msg\":\"success\"}', 6);
INSERT INTO `operate_log` VALUES (1086, 1, '2024-07-12 09:24:16', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', 'null', 1);
INSERT INTO `operate_log` VALUES (1087, 58, '2024-07-12 09:24:21', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (1088, 58, '2024-07-12 09:24:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendMake', '[58, 111]', '{\"code\":1,\"data\":\"好友请求发送成功\",\"msg\":\"success\"}', 3);
INSERT INTO `operate_log` VALUES (1089, 58, '2024-07-12 09:24:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (1090, 58, '2024-07-12 09:24:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 1);
INSERT INTO `operate_log` VALUES (1091, 58, '2024-07-12 09:24:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (1092, 58, '2024-07-12 09:24:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (1093, 58, '2024-07-12 09:24:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (1094, 58, '2024-07-12 09:24:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[58]', 'null', 0);
INSERT INTO `operate_log` VALUES (1095, 1, '2024-07-12 09:24:29', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'friendRequest', '[1]', '{\"code\":1,\"data\":[{\"id\":58,\"username\":\"222\"}],\"msg\":\"success\"}', 1);
INSERT INTO `operate_log` VALUES (1096, 61, '2024-07-12 09:25:22', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'sendMsg', '[ChatMsg(id=null, send=61, receive=58, msg=？, time=null, state=null)]', '{\"code\":1,\"data\":\"消息发送成功\",\"msg\":\"success\"}', 2);
INSERT INTO `operate_log` VALUES (1097, 61, '2024-07-12 09:25:23', 'org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint$MethodSignatureImpl', 'sendMsg', '[ChatMsg(id=null, send=61, receive=58, msg=？, time=null, state=null)]', '{\"code\":1,\"data\":\"消息发送成功\",\"msg\":\"success\"}', 2);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `user_id` int NOT NULL COMMENT '发起订单的用户id',
  `amount` double NOT NULL COMMENT '订单金额',
  `time` datetime NOT NULL COMMENT '订单时间',
  `state` tinyint NOT NULL COMMENT '订单状态，0未支付，1已支付',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('0613a4f7-3929-4c45-b976-9d2e9c08dbdf', 1, 648, '2024-07-11 19:56:35', 0);
INSERT INTO `order` VALUES ('15f4c155-19ae-4a8b-bd08-aeac7256374f', 58, 500, '2024-07-11 21:07:08', 1);
INSERT INTO `order` VALUES ('283bf62c-3cbe-4572-bb1d-1099b621bf35', 1, 3, '2024-07-11 22:02:23', 1);
INSERT INTO `order` VALUES ('284e6fe8-693e-4cfc-99cc-1d9b212a2997', 1, 3.6, '2024-07-11 20:31:37', 1);
INSERT INTO `order` VALUES ('29fb174b-6357-440f-b5d2-8fa02305ed8a', 1, 648, '2024-07-12 01:05:00', 1);
INSERT INTO `order` VALUES ('3943a387-c4ca-4000-bf72-24b4f195a343', 61, 648, '2024-07-12 09:06:16', 0);
INSERT INTO `order` VALUES ('39e62830-5b0e-4cc3-b609-187ddfde2953', 1, 648, '2024-07-11 20:26:13', 0);
INSERT INTO `order` VALUES ('4fcc8229-4c03-4aa4-9ef2-83076628ebdc', 1, 648, '2024-07-11 20:25:47', 1);
INSERT INTO `order` VALUES ('583cd51e-82e5-465a-ab2f-0dce0a0b4e03', 1, 1, '2024-07-11 22:03:10', 1);
INSERT INTO `order` VALUES ('5bf4228d-6811-475d-81cc-7534a926b47d', 60, 648, '2024-07-12 08:55:51', 1);
INSERT INTO `order` VALUES ('645756d1-35bf-4f9d-aec2-a80fc627c07b', 1, 648, '2024-07-11 20:26:43', 1);
INSERT INTO `order` VALUES ('6ebc1efe-91fe-4fbe-ae18-df22c1788271', 1, 648, '2024-07-11 20:30:51', 1);
INSERT INTO `order` VALUES ('922611d2-2cb4-40af-bb0c-1323e61ea81b', 1, 648, '2024-07-11 20:26:25', 0);
INSERT INTO `order` VALUES ('96254e0b-083e-4f96-98c9-6937aca65d53', 60, 648, '2024-07-12 08:55:19', 0);
INSERT INTO `order` VALUES ('9ec974b5-639c-4d65-bf4c-b10a4a019160', 1, 648, '2024-07-11 20:02:52', 1);
INSERT INTO `order` VALUES ('ac4f580b-7663-47b0-9829-c6fb126a39db', 1, 648, '2024-07-12 08:09:45', 1);
INSERT INTO `order` VALUES ('ae93c58b-9b7a-4830-afeb-6797c39be063', 1, 648, '2024-07-11 21:57:51', 0);
INSERT INTO `order` VALUES ('b53f7e6d-ec1e-4ea9-b132-65f5ccf84821', 1, 648, '2024-07-11 20:03:45', 1);
INSERT INTO `order` VALUES ('b74e571a-0f26-4df0-b214-fc309fcb5a8e', 1, 648, '2024-07-11 20:18:10', 1);
INSERT INTO `order` VALUES ('c123b946-1ffe-4d91-a023-a9144dd3f168', 1, 648, '2024-07-11 19:59:43', 0);
INSERT INTO `order` VALUES ('c486e02f-9f97-49e2-8bb5-b48d22e0c116', 1, 648, '2024-07-11 21:59:55', 0);
INSERT INTO `order` VALUES ('c5a99f7d-2e7c-4d08-aeeb-3e58cb5c9b33', 1, 648, '2024-07-11 19:56:57', 0);
INSERT INTO `order` VALUES ('cd95efe1-d285-4c2e-9196-61c9fda47c52', 1, 648, '2024-07-11 22:01:51', 1);
INSERT INTO `order` VALUES ('d35734a2-0700-4934-862e-9a1dc81a7b8b', 1, 0.01, '2024-07-11 20:39:08', 1);
INSERT INTO `order` VALUES ('d6d731cf-5443-4606-bdf9-ecb7ed348985', 1, 648, '2024-07-11 20:17:49', 0);
INSERT INTO `order` VALUES ('e90a867d-a85a-4b2c-bf7f-dcf165affeaf', 1, 648, '2024-07-11 20:01:46', 0);
INSERT INTO `order` VALUES ('ed7cc3f1-376f-4d8e-90a7-206ad1f399e7', 1, 6, '2024-07-11 22:00:47', 0);

-- ----------------------------
-- Table structure for publisher
-- ----------------------------
DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '发行商id',
  `publisher` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发行商',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of publisher
-- ----------------------------
INSERT INTO `publisher` VALUES (1, '武汉理工大学');
INSERT INTO `publisher` VALUES (2, '扬州江都职教');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键序号id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '123456' COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '男0，女1',
  `image` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图像',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `province` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省份',
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地区',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `emailcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_pk2`(`username` ASC) USING BTREE,
  UNIQUE INDEX `user_pk`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '111', '111', '韦詩涵', NULL, 'https://web-heaven-tlias.oss-cn-beijing.aliyuncs.com/dd84c1d7-7512-4a2e-8cde-b4301dfa2697.jpg', 'shihawei111@yahoo.com', '深圳', '489 Shennan Ave, Futian District', '2016-05-29', '61v1C76sBH');
INSERT INTO `user` VALUES (2, 'zxia216', 'pAKJxsxPde', '曾晓明', 1, 'l36NUERZzE', 'xiaomingzeng@outlook.com', '上海市', '938 Jianxiang Rd, Pudong', '2001-01-07', 'Nuvnb4b6sn');
INSERT INTO `user` VALUES (3, 'taoyunxi2', 'TYGRQ4TUZU', '陶云熙', 0, 'bloNNUl86Z', 'tao102@icloud.com', '成都市', '480 NO.6, YuShuang Road, ChengHua Distric', '2002-02-03', 'wyvCaHvNIK');
INSERT INTO `user` VALUES (4, 'jiang43', '1t2mS9xuEX', '姜秀英', 1, '7oyWZhqlRT', 'xiuying2@outlook.com', '上海市', '748 Ganlan Rd, Pudong', '2019-05-15', '29pJxUhK3i');
INSERT INTO `user` VALUES (5, 'ruifan', 'NP3kya4kFo', '韦詩涵6', 1, 'e3pqoWyfoU', 'shihawei1101@yahoo.com', '深圳', '489 Shennan Ave, Futian District', '2016-05-29', '61v1C76sBH');
INSERT INTO `user` VALUES (6, 'zhwei7', 'yVFeFGQD3y', '韦致远', 1, 'uHmZFVerdq', 'wezh@gmail.com', '上海市', '625 Binchuan Rd, Minhang District', '2001-05-27', 'vcceUyI86B');
INSERT INTO `user` VALUES (7, 'hji', 'lpQ4YLc7ho', '黄嘉伦', 0, 'o3IJIENnAO', 'jialunh@gmail.com', '上海市', '860 Ganlan Rd, Pudong', '2003-07-15', 'Hx4KxTy3Tv');
INSERT INTO `user` VALUES (8, 'xu19', 'V5xNd34Ui0', '许嘉伦', 1, 'aaQHaRTwl5', 'xujialun@outlook.com', '中山', '紫马岭商圈中山五路406号', '2006-12-02', '76Ov8UiPOm');
INSERT INTO `user` VALUES (9, 'ruixue', 'NphkPbtWTl', '薛睿', 0, 'Ta4aDNUg0l', 'xueru@yahoo.com', '北京市', '房山区岳琉路199号', '2015-02-04', '8vUbWXxMqg');
INSERT INTO `user` VALUES (10, 'kongshihan', 'MocwbJVWfT', '孔詩涵', 0, 'hMmlLBHgLK', 'konshi@gmail.com', '东莞', '珊瑚路675号', '2020-12-24', '7vV1JRD6Ry');
INSERT INTO `user` VALUES (11, 'songjiehong521', 'GOQ3BtJSUE', '宋杰宏', 1, '5Ru071OP61', 'jiehong07@gmail.com', '广州市', '652 Xiaoping E Rd, Baiyun ', '2008-03-02', 'o3oyOVRE2E');
INSERT INTO `user` VALUES (12, 'lixiaoming', 'qrSO3RQesv', '李晓明', 0, '2Mi1CXKzK7', 'xiaomingl@icloud.com', '上海市', '454 Ganlan Rd, Pudong', '2002-04-21', 'Wfwhkdj5Vj');
INSERT INTO `user` VALUES (13, 'zouz925', 'Y0703vLzxR', '邹震南', 1, 'uhJLCQVXG7', 'zhennan702@yahoo.com', '中山', '京华商圈华夏街829号', '2000-06-04', 'H1yXivvEL6');
INSERT INTO `user` VALUES (14, 'liangzhennan', '73NwMowI3E', '梁震南', 1, 'iHqzYBL8iV', 'zhennanlian@icloud.com', '成都市', '成华区玉双路6号47号', '2011-12-12', '9b1jlibptV');
INSERT INTO `user` VALUES (15, 'lu417', 'MAc0hD1Vce', '侯璐', 0, '8lxie9HpLo', 'luho@outlook.com', '北京市', '房山区岳琉路855号', '2016-08-25', 'nbrUk1gsBl');
INSERT INTO `user` VALUES (16, 'lanshi', 'r2syqD7URT', '石岚', 1, 'EAmj1FXsfk', 'shil@icloud.com', '上海市', '徐汇区虹桥路771号', '2011-04-14', 'pBhuVSRJtV');
INSERT INTO `user` VALUES (17, 'ruxiao', 'AjvwPrdYbH', '萧睿', 0, 'JBPT4lv0WI', 'rui1215@yahoo.com', '北京市', '延庆区028县道201号', '2004-01-26', '2MGhhyq2Jb');
INSERT INTO `user` VALUES (18, 'soshihan', 'HA6e0e7lvt', '宋詩涵', 0, 'Lz3mF2r9CY', 'shihansong7@hotmail.com', '上海市', '726 Jianxiang Rd, Pudong', '2009-11-07', '7R8pXvAOk9');
INSERT INTO `user` VALUES (19, 'yunxixu908', '22KmM5YQWf', '许云熙', 1, 'f6ZvAqqzhe', 'xu4@icloud.com', '北京市', '东城区东单王府井东街199号', '2013-09-24', 'D3vZW37Kdx');
INSERT INTO `user` VALUES (20, 'dai616', 'no1rqNjQ3Y', '戴宇宁', 0, '1Nrsc8docA', 'ydai02@gmail.com', '中山', '63 Daxin S Rd, Daxin Shangquan, Tianhe Qu', '2015-02-17', 'eEWw7ENRiW');
INSERT INTO `user` VALUES (21, 'lumao', 'RozIzK1uA4', '毛璐', 0, 'LNeXfRG1Ja', 'luma@icloud.com', '北京市', '朝阳区三里屯路450号', '2008-07-14', 'fRVX1SKsXm');
INSERT INTO `user` VALUES (22, 'atian89', 'a44tfNf26X', '田安琪', 1, 'SgQhCszCJP', 'anqi1983@mail.com', '广州市', '668 Jiangnan West Road, Haizhu District', '2017-09-16', 'ZgjWslJ6LP');
INSERT INTO `user` VALUES (23, 'lu12', '2d7JKWJx0E', '张璐', 0, 'Kb1ItjjTIP', 'zhang19@icloud.com', '上海市', '徐汇区虹桥路678号', '2006-05-11', '5IjuyQKH8P');
INSERT INTO `user` VALUES (24, 'malan7', '6f8SoTTKos', '马岚', 1, 'wLku7GyiF4', 'lanma@gmail.com', '深圳', '591 Tianbei 1st Rd, Luohu District', '2014-06-13', 'vkyy9bGEBF');
INSERT INTO `user` VALUES (25, 'peng520', 'KMr4JdjlYs', '彭璐', 0, 'ylnjt1mB6Y', 'lupeng@icloud.com', '北京市', '房山区岳琉路756号', '2001-03-01', 'G1Vss4UF3U');
INSERT INTO `user` VALUES (26, 'pengzhennan75', 'ttaBOCpdGZ', '彭震南', 0, 'Tx99VTj7xx', 'pzhennan@outlook.com', '深圳', '364 Jingtian East 1st St, Futian District', '2005-05-03', 'MsOHptbC54');
INSERT INTO `user` VALUES (27, 'rui713', 'lflWnklKNS', '董睿', 0, 'Q1NUFnmbkS', 'dongrui02@gmail.com', '北京市', '延庆区028县道524号', '2019-12-16', 'bLw85um4lL');
INSERT INTO `user` VALUES (28, 'xiezitao', 'XkWycvi9Zf', '谢子韬', 1, 'cqucZGPFmu', 'zitaxie@outlook.com', '上海市', '715 Hongqiao Rd., Xu Hui District', '2018-07-19', 'aITqTWAS1B');
INSERT INTO `user` VALUES (29, 'lawa1983', 'ucToJv5K75', '王岚', 1, 'GVPzEP6maM', 'lanwan@gmail.com', '深圳', '660 Xue Yuan Yi Xiang, Longgang', '2000-11-11', 'WUvVHS0fPH');
INSERT INTO `user` VALUES (30, 'dazhiyuan03', 'RBQvilgRE1', '戴致远', 1, 'pTsKTyc1ii', 'daizhiyuan@outlook.com', '广州市', '971 Xiaoping E Rd, Baiyun ', '2008-10-14', 'yusdeSHFrc');
INSERT INTO `user` VALUES (31, 'px627', '3LLhOz1fRg', '潘晓明', 1, 'Xv6gD1H9TD', 'xiaopa@gmail.com', '中山', '655 Lefeng 6th Rd', '2006-08-20', '5faPRL8vfF');
INSERT INTO `user` VALUES (32, 'yuningzou', 'oeM1VwaVcP', '邹宇宁', 1, 'NQoj7KENfP', 'yunzou@icloud.com', '中山', '紫马岭商圈中山五路352号', '2004-09-23', 'beILEGVNbT');
INSERT INTO `user` VALUES (33, 'zy62', 'lP6i2UeFXL', '尹震南', 0, 'kq7ah8ttbr', 'zhennanyi@gmail.com', '上海市', '徐汇区虹桥路602号', '2020-05-05', 'pBRQnmBgRR');
INSERT INTO `user` VALUES (34, 'shihanlin2', 'WDchkBs8qr', '林詩涵', 1, 'xp5cTgY8u8', 'shili@hotmail.com', '成都市', '946 3rd Section Hongxing Road, Jinjiang District', '2015-04-27', 'YsyxHoy8C4');
INSERT INTO `user` VALUES (35, 'shijiehong', 'DZpQrCqQOH', '石杰宏', 1, 'oyXauqtn9O', 'shijiehong@icloud.com', '北京市', '697 East Wangfujing Street, Dongcheng District ', '2002-08-20', 'pdDJAryqdG');
INSERT INTO `user` VALUES (36, 'zhiyuanfu5', 'k4JtUEzR3R', '傅致远', 1, '6zf7vsCok4', 'fuz7@outlook.com', '中山', '916 Zhongshan 5th Rd, Zimaling Shangquan', '2012-07-30', 'NnD5u1LVU8');
INSERT INTO `user` VALUES (37, 'ziyil', 'HVpkra1Nar', '刘子异', 1, '0Uwfk18svF', 'liuziy@outlook.com', '深圳', '178 Shennan E Rd, Cai Wu Wei, Luohu District', '2005-08-08', '2KHrYWPiFm');
INSERT INTO `user` VALUES (38, 'liaoanq6', 'YdJ27sRhSj', '廖安琪', 1, 'DuwZ61T7Ch', 'liaoanqi03@mail.com', '成都市', '917 4th Section  Renmin South Road, Jinjiang District', '2011-02-23', 'wsBB164j7p');
INSERT INTO `user` VALUES (39, 'jiangz', 'kCZfCPzjPE', '姜致远', 1, 'yA1VOvfcDO', 'zhiyuanj905@gmail.com', '深圳', '罗湖区蔡屋围深南东路624号', '2015-12-02', 'OioCGDEUPX');
INSERT INTO `user` VALUES (40, 'zhiyuanlia8', 'toY26ZtmsS', '梁致远', 0, 'e0UtVW8Snt', 'zhiyuan1950@icloud.com', '中山', '乐丰六路682号', '2019-08-16', 'suZFogUNLS');
INSERT INTO `user` VALUES (41, 'shi915', 'sVSsuLcLDM', '石杰宏', 1, 'KuDFffdkt8', 'shji5@gmail.com', '北京市', '房山区岳琉路955号', '2021-11-10', 'eMRAxBO78M');
INSERT INTO `user` VALUES (42, 'xiaomingzhong', 'Gq3dyTIvvM', '钟晓明', 1, 'sOvYQVnXyM', 'xiaozhong@outlook.com', '北京市', '574 East Wangfujing Street, Dongcheng District ', '2003-10-15', 'tUs5sBvwzr');
INSERT INTO `user` VALUES (43, 'shxiang', 'bKLzefvhxt', '向詩涵', 1, 'fxmVVSNKc7', 'shihan5@hotmail.com', '上海市', '徐汇区虹桥路311号', '2023-11-27', '3y45FWV4W5');
INSERT INTO `user` VALUES (44, 'leiy', 'xRCSSd6IWi', '雷云熙', 1, 'NwYnkphVPa', 'yunxilei@icloud.com', '上海市', '592 Binchuan Rd, Minhang District', '2005-03-27', 'OgveXtQvl9');
INSERT INTO `user` VALUES (45, 'gong1', 'UGb6z2QCrv', '龚璐', 0, 'FZ1lLgRq7u', 'lgong9@yahoo.com', '深圳', '罗湖区田贝一路901号', '2023-04-30', 'Q73PaNJvGh');
INSERT INTO `user` VALUES (46, 'jiehong1944', 'O36AtrVNjx', '冯杰宏', 0, 'pfcZzSSpIc', 'fengjiehong@outlook.com', '中山', '585 Zhongshan 5th Rd, Zimaling Shangquan', '2022-08-09', 'zSZ2EZNxa0');
INSERT INTO `user` VALUES (47, 'anqdon', 'SAaoOQT7SP', '董安琪', 0, 'Rb3z1oRhpE', 'adong@mail.com', '北京市', '東城区東直門內大街797号', '2022-03-23', 'CzKSkWpj0t');
INSERT INTO `user` VALUES (49, 'hu1997', 'CKyO7VtISs', '胡岚', 1, 'FUQ8fwBjKt', 'hlan1@gmail.com', '广州市', '30 Tangyuan Street 5th Alley, Airport Road, Baiyun', '2006-03-04', 'VOgSbEbB1Y');
INSERT INTO `user` VALUES (58, '222', '222', NULL, NULL, NULL, '22@qq.com', NULL, NULL, '2024-07-11', NULL);
INSERT INTO `user` VALUES (59, 'heaven', 'xgy.003214', '666', 0, 'https://web-heaven-tlias.oss-cn-beijing.aliyuncs.com/f21ed0c4-5414-46cd-b01b-f7be4cf181cd.jpg', '2360199681@qq.com', '湖北省', '武汉市', '2003-02-14', '6666');
INSERT INTO `user` VALUES (60, 'AbyssWatcher', '123', 'AbyssWatcher', NULL, 'https://web-heaven-tlias.oss-cn-beijing.aliyuncs.com/0f41687a-6685-4613-9e72-8d6bbbbd7eda.jpg', '2478024268@qq.com', NULL, NULL, '2024-07-08', NULL);
INSERT INTO `user` VALUES (61, '666', '666', '?#?', NULL, 'https://web-heaven-tlias.oss-cn-beijing.aliyuncs.com/8514856e-b1e7-470d-9385-ef0d54dcee73.jpg', '1989375151@qq.com', '6', '6', '2024-07-03', '6');
INSERT INTO `user` VALUES (62, 'PostMan', '123', NULL, NULL, NULL, '2478024268@qq.com', NULL, NULL, '2024-07-02', NULL);

-- ----------------------------
-- Table structure for verification_codes
-- ----------------------------
DROP TABLE IF EXISTS `verification_codes`;
CREATE TABLE `verification_codes`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮件',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '验证码',
  `time` datetime NULL DEFAULT NULL COMMENT '生成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of verification_codes
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
