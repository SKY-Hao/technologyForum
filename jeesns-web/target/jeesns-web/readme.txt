redoopForum
开发语言：JAVA
数据库：MYSQL
JAVA开发框架：Spring MVCSpring++Mybatis
前台前端开发框架：ZUI+JQuery+Bootstrap
前台模板引擎：Freemarker
环境要求
 JDK7或更高版本
 Tomcat7.0或更高版本
 MySQL5.1或更高版本

简介
 redoopForum是一款基于JAVA企业级平台研发的BBS。
 官方网址：http://www.redoopForum.com。

应用场景
 redoopForum是一个企业级的开源社区系统，是一个可以用来搭建门户、主题、文档的BBS系统。
 redoopForum以人为中心，通过用户的需求和行为将最有价值的信息得以不断整合。
 redoopForum是一个稳定、安全、可扩展的社区系统，可以帮您搭建与众不同的交流社区。

私信功能
 界面模仿PC版微信
 可以查看私聊过的联系人
 聊天界面自动刷新
个人主页
 关注会员
 私信会员
 查看动态
 查看粉丝、关注、文章、主题帖子
主题模块
 可以关注主题
 支持发帖审核开关
 授权管理员
 帖子喜欢功能
文档模块
 文档喜欢功能
 文档投稿功能开关
 文档审核功能开关
 文档评论
动态模块
 查看所有操作


搭建步骤
 1、将重新上传到支持JAVA的空间或者服务器上；
 2、导入数据库，将/database/redoopForum.sql导入到mysql数据库中；
 3、修改数据库信息，修改文件：WEB-INF\classes\redoopForum.properties
    jdbc.driver=com.mysql.jdbc.Driver
    jdbc.url=jdbc:mysql://数据库服务器IP(本地直接用localhost):端口号(默认3306)/数据库名?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull
    jdbc.user=数据库用户名
    jdbc.password=数据库密码
    #后台管理目录
    managePath=manage

 4、重启Tomcat。
  后台登录地址：http://域名/manage/index
  后台用户名：admin
  密码：redoopadmin