# entfrm-boot

### 平台简介    
entfrm快速开发平台，是一个Web可视化开发平台，是一个集PC和APP快速开发、系统管理、运维监控、开发工具、OAuth2授权、可视化数据源管理与数据构建、API动态生成与统计、工作流、智能表单设计、微服务骨架等全方位功能于一体的高效、稳定的快速开发平台。
平台采用Spring Boot 2.X 、Spring Security、Oauth2、Mybatis Plus、 Flutter等核心技术，前端基于vue-element-admin框架。 演示地址：http://47.100.3.58/
#### 参考项目：pig、ruoyi
###  entfrm官方交流群：871910881
### 软件功能
#### 1.系统管理
 - [x] 机构管理：配置系统组织机构，无限级树结构展现支持数据权限。

 - [x] 角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。

 - [x] 用户管理：用户是系统操作者，该功能主要完成系统用户配置。

 - [x] 菜单管理：配置系统菜单，操作权限，按钮权限标识等。

 - [x] 字典管理：对系统中经常使用的一些较为固定的数据进行维护。

 - [x] 参数管理：对系统动态配置常用参数。

 - [ ] 快捷方式：添加顶部、首页快捷方式。

 - [x] 文件管理：文件统一管理。

 - [x] 终端管理：OAuth2 授权码模式，灵活管理。

 - [x] 数据备份：mysql数据库备份与还原。

#### 2.运维监控
 - [x] 令牌管理：用户登录token管理。

 - [x] 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。

 - [x] 数据监控: 监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。

 - [x] 服务监控: 监视当前系统CPU、内存、磁盘、堆栈等相关信息。

 - [ ] API监控：restful api 接口调用统计、可视化。

  日志监控

 - [x] 登录日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。

 - [x] 操作日志：系统登录日志记录查询包含登录异常。
#### 3.开发工具
 - [ ] 数据源管理：Mysql、SQL Server、PostgreSQL等主流数据库在线管理、表管理（新建、修改、删除、查询）、代码生成√。

 - [ ] API管理：基于数据源动态生成restful api，支持管理、发布、权限控制、api统计。

 - [ ] 智能表单：基于数据源动态生成表单，多终端支持。

 - [ ] 工作流：功能包括在线办公、我的任务、审批测试、流程管理、模型管理。
### 代码结构
~~~
entfrm-boot
|--entfrm-auth Oauth2授权
|--entfrm-biz 
|----entfrm-biz-monitor 运维监控模块
|----entfrm-biz-system 系统管理模块
|--entfrm-core 
|----entfrm-core-base 基础核心模块
|----entfrm-core-data 数据核心模块
|----entfrm-core-log 日志核心模块
|----entfrm-core-security 安全核心模块
|--entfrm-web Web模块
~~~
### 在线演示

1. 地址：<http://47.100.3.58/>
2. 账号：entfrm
3. 密码：123456

### 使用说明

1. 配置环境（jdk1.8、maven3.x、mysql5.6及以上、redis3.2及以上）
2. 创建数据库
3. 初始化sql脚本：entfrm.sql
4. 导入项目到IntelliJ IDE中
5. 修改配置文件entfrm-boot/entfrm-web/src/main/resources/application.yml
    * redis 配置
    * datasource 数据源配置
6. 启动WebApplication
7. 启动entfrm-ui

### 演示效果
<table>
    <tr>
        <td><img src="http://47.100.3.58/static/img/login.png"/></td>
        <td><img src="http://47.100.3.58/static/img/home.png"/></td>
    </tr>
    <tr>
        <td><img src="http://47.100.3.58/static/img/dept.png"/></td>
        <td><img src="http://47.100.3.58/static/img/role.png"/></td>
    </tr>
    <tr>
        <td><img src="http://47.100.3.58/static/img/user.png"/></td>
        <td><img src="http://47.100.3.58/static/img/menu.png"/></td>
    </tr>
	<tr>
        <td><img src="http://47.100.3.58/static/img/dict.png"/></td>
        <td><img src="http://47.100.3.58/static/img/oauth.png"/></td>
    </tr>	 
    <tr>
        <td><img src="http://47.100.3.58/static/img/loginLog.png"/></td>
        <td><img src="http://47.100.3.58/static/img/operLog.png"/></td>
    </tr>
</table>

