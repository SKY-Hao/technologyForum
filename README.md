# RedoopForum

开发语言：JAVA

数据库：MYSQL

JAVA开发框架：Spring MVC+Spring+Mybatis

前台前端开发框架：ZUI+JQuery+Bootstrap

前台模板引擎：Freemarker

## 简介
RedoopForum是一款基于JAVA企业级平台研发的社交管理系统

## 应用场景
- RedoopForum是一个企业级的开源社区系统，是一个可以用来搭建门户、主题、论坛和微博的社区系统。
- RedoopForum是将SNS社会化网络元素，人和主题结合在一起的新型的社交系统。
- RedoopForum以人为中心，通过用户的需求和行为将最有价值的信息得以不断整合。
- RedoopForum是一个稳定、安全、可扩展的社区系统，可以帮您搭建与众不同的交流社区。
- 如果您要需要搭建一个论坛,那么您可以用RedoopForum
- 如果您需要一个主题，那么您可以用RedoopForum
- 如果您需要因为某个话题来汇聚人群，那么您可以用RedoopForum

## 功能模块
- 私信功能
1. 界面模仿PC版微信
2. 可以查看私聊过的联系人
3. 聊天界面自动刷新

- 个人主页
1. 关注会员
2. 私信会员
3. 查看动态
4. 查看粉丝、关注、文章、帖子、主题

- 主题模块
1. 可以关注主题
2. 支持上传主题logo
3. 支持发帖审核开关
4. 授权管理员
5. 帖子喜欢功能

- 文章模块
1. 文章喜欢功能
2. 文章投稿功能开关
3. 文章审核功能开关
4. 文章评论


## 环境要求

- JDK7或更高版本
- Tomcat7.0或更高版本
- MySQL5.1或更高版本

## 部署说明

1. 创建数据库。如使用MySQL，字符集选择为`utf8`或者`utf8mb4`（支持更多特殊字符，推荐）。
2. 执行数据库脚本。数据库脚本在`jeesns-web/src/main/webapp/database`目录下。
3. 在eclipse中导入maven项目。点击eclipse菜单`File` - `Import`，选择`Maven` - `Existing Maven Projects`。
4. 设置项目编码为utf-8，选择jdk1.7版本或以上，不要选择jre。
5. 修改数据库连接。打开`/src/main/resources/RedoopForum.propertis`文件，根据实际情况修改`jdbc.url`、`jdbc.user`、`jdbc.password`的值，修改后台路径：`managePath`，如：`managePath=manage`
6. 编译项目。在eclipse中，右键点击项目名，选择`Run as` - `Maven build...`，`Goals`填入`clean package`，然后点击`Run`，第一次运行需要下载jar包，请耐心等待。
7. 部署项目。将项目部署到Tomcat7或以上版本，启动Tomcat。

   

"# RedoopForum" 
# technologyForum
