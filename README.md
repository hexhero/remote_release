# remote_release 
远程部署工具(本地应用快速部署至远程服务器)
<a href="https://996.icu"><img src="https://img.shields.io/badge/link-996.icu-red.svg" alt="996.icu" /></a>
[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg)](https://github.com/996icu/996.ICU/blob/master/LICENSE)  

### remote_tomcat.sh
远程部署war包或者静态html文件到tomcat,并重启服务。

*Tips：1. MS_Windows系统请使用 Git bash 运行此脚本. 2.使用前请先在脚本中配置环境*

* 功能说明
  * [1] 备份远程Tomcat webapps目录到 /home 目录下
  * [2] 关闭远程Tomcat服务
  * [3] 清空远程Tomcat webapps目录
  * [4] 发送一个应用文件文件到远程 webapps 目录中
  * [5] 发送一个文件夹下的文件到远程 webapps/ROOT 目录中
  * [6] 启动远程Tomcat
  * [7] 免除重复认证.(命令执行过程中需要重复输入密码，可使用此选项，输入一次即可)

