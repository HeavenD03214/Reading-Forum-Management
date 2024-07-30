# 系统介绍

 ![](media/33ab5596663ebe3e5fd27b6803769cd4.jpeg)

 本小组设计了一个阅读论坛管理系统。该系统实现了书籍的添加、删除、查询以及用户之间相互添加好友、聊天功能、抽卡功能等，同时提供了用户登录、注册和管理员权限设置等功能。本人主要为后端负责人，负责后端框架开发及向前端提供接口

主要技术栈为：

Spring boot + mybatis + mysql + websocket + AOP 集成阿里云文件上传，支付宝支付

# 开发计划

![屏幕截图 2024-07-29 102004](media\屏幕截图 2024-07-29 102004.png)

# 后端

## 项目结构设计

![屏幕截图 2024-07-29 105012](media\屏幕截图 2024-07-29 105012.png)

## 数据库表结构设计
### 书籍表
![](media/f54a8414be89e63a929af7d69c03b099.png)
### 发行商表；
![](media/78d09f8e9240cba90137d5e00ee71f9f.png)
### 作者表；
![](media/d37a4c23dba32d84dd1695f3aa9c7780.png)
### 用户表
 ![](media/6f5e2f427cdde57699766966fa5c67fe.png)
### 订单表；
![](media/3df1a9cedd29de927f808a188e9b1942.png)
### 余额表；
![](media/088114e6572ccbcd5ac17fb274f22c50.png)
### 好友状态维护表
 ![](media/d7ea3d96d4d6bd22a184de65e8ff10bf.png)
### 消息状态维护表
![](media/55137c6dff9296d40f326c1e40a4a534.png)
### 操作记录表
![](media/130d34e3f4b1a9a4a28f5f503679d279.png)



## 项目主要实现
### 调用官方API生成和解析JWT令牌
![屏幕截图 2024-07-29 105614](media\屏幕截图 2024-07-29 105614.png)
### 设置登录拦截器

> 1.生成token时使用了用户信息和用户权限
>
> 2.拦截请求解析令牌时进行了身份验证和权限管理

![image-20240729110958691](media\image-20240729110958691.png)

### swagger管理接口文档

![image-20240729105224119](media\image-20240729105224119.png)

### 集成支付宝支付

> 1.新建支付宝配置类从yml导入相关配置
>
> 2.实现前端调用接口使用支付宝SDK生成表单写入响应体返回

![image-20240729105332885](image-20240729105332885.png)

> 3.设置回调地址，编写回调实现

![image-20240729105537569](media\image-20240729105537569.png)

### 切面编程记录增删改操作

![](media/3596fe9c4baedb617c1652acc1b73106.jpeg) ![](media/e449dbccfece12ffef3bd50cd5498d7e.jpeg)

![](media/2f24550bde8b0e6c09ddeaaf2427e928.png)

### 简单抽卡模型

> 扩展点：可增加卡的类型，可增加卡的稀有度表

![屏幕截图 2024-07-29 111423](media\屏幕截图 2024-07-29 111423.png)

> 伪随机稀有度区间划分

![屏幕截图 2024-07-29 111557](media\屏幕截图 2024-07-29 111557.png)

# 多人聊天

### 1.好友申请

> 通过好友申请表存储好友信息，0为待接受，1是成为好友

![](media/d7ea3d96d4d6bd22a184de65e8ff10bf.png)

> 如果请求方在线，通过websocket通知前端进行请求列表更新拉取

![屏幕截图 2024-07-29 105718](media\屏幕截图 2024-07-29 105718.png)
### 2.聊天

> 1.将消息存储在数据库中
>
> 2.如果消息接收方在线将使用websocket通知前端进行实时刷新
>
> 3.通过接口将消息返还给前端

![](media/55137c6dff9296d40f326c1e40a4a534.png)

![屏幕截图 2024-07-29 105750](media\屏幕截图 2024-07-29 105750.png)
### 3.列表状态获取

> 实现将好友间最新消息，未读消息数返回给前端并更新消息为已读状态

![](media/ead5441d86a74b05d59bdf4bd70a2588.jpeg)

![](media/e50e325a661a5e0f615dfdb188438c42.jpeg)

![](media/731ed6e0c4cd2c06ee81ed2ad3577f0c.jpeg)![](media/54d58eadf119b3047fc5a4de074827d4.jpeg)



# 功能展示

## 主页面

![](media/4579b11f64dee57d16d4c510303068e0.png)

## 作者一览

![](media/cebdbe709f09fdef297a8d1ba8d3ec18.png)

## 书籍一览

![](media/49ecb15261ac0edffc68802ca6c7b93e.jpeg)

## 签到

![](media/639d539b44c2283937bb8cff84863f88.png)![](media/33d1f1b337eec6b1c6d0f3776698f152.png)![](media/3b95beee5e33c3f5a519d645a0279748.jpeg)![](media/33ab5596663ebe3e5fd27b6803769cd4.jpeg)

## 充值界面

![屏幕截图 2024-07-29 110645](media\屏幕截图 2024-07-29 110645.png)

## 抽卡界面

![](media/278bd0db671852ce7b081b540c74a401.png)

## 聊天室
![](media/817efca17103871d4b7cad4b215a8d3f.png)
## 作者面板
![](media/ef3ebcbcbc0019992cf25f19e9a74808.png)

## 管理员面板

![](media/a5dfe1605f8afcb261adf0f692795f05.png)
## 好友列表和私人聊天
![image-20240729110742646](C:\Users\HeavenDirt\AppData\Roaming\Typora\typora-user-images\image-20240729110742646.png)
## 个人资料修改
![](media/1f634b344652eed41de0c7cf92cbad4d.png)
