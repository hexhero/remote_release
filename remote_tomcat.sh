#!/usr/bin/env bash

# Tip： MS_Windows系统请使用 Git bash 运行此脚本。

#################功能描述#########################
<<!
# [1] 备份远程Tomcat webapps目录到 /home 目录下
# [2] 关闭远程Tomcat服务
# [3] 清空远程Tomcat webapps目录
# [4] 发送一个应用文件文件到远程 webapps 目录中
# [5] 发送一个文件夹下的文件到远程 webapps/ROOT 目录中
# [6] 启动远程Tomcat
# [7] 免除重复认证.(命令执行过程中需要重复输入密码，可使用此选项，输入一次即可)
# [0] 退出
!

#################环境配置##########################

# 服务器地址
host="192.168.1.165"
# 用户名
user="root"
# 远程服务器Tomcat目录
REMOTE_TOMCAT_DIR="/data/ysoffice/t3" # 8100
# 远程服务器jdk环境变量
REMOTE_JAVA_HOME="/usr/local/java1.7/jdk1.7.0_80"

# 本地应用路径
app_file="C:/Users/DELL/Documents/APL_PROJECT/YS-OFFICE/ys-web/target/ys-web.war"
# 本地应用目录
app_dir="C:/Users/DELL/Documents/APL_PROJECT/ys-info/src/main/dist"

###################################################

tip=" - Press any key to continue"

while [ 1 ]

do
clear
echo -e "
______ _   _ _____  _   __  _____ ________  ________   ___ _____
|  ___| | | /  __ \| | / / |_   _|  _  |  \/  /  __ \ / _ \_   _|
| |_  | | | | /  \/| |/ /    | | | | | | .  . | /  \// /_\ \| |
|  _| | | | | |    |    \    | | | | | | |\/| | |    |  _  || |
| |   | |_| | \__/\| |\  \   | | \ \_/ / |  | | \__/\| | | || |
\_|    \___/ \____/\_| \_/   \_/  \___/\_|  |_/\____/\_| |_/\_/

     \033[33m ======= Remote tomcat deploy shell! @yangb ======= \033[0m    "
echo
echo -e "Host: \033[32m${host}\033[0m | User: \033[32m${user}\033[0m | Remote tomcat path: \033[32m${REMOTE_TOMCAT_DIR}\033[0m"
echo
echo -e "\033[36mOptions:\033[0m"
echo
echo "[1] Backup webapps to /home directory in the remote server" # 备份远程 webapps目录到 /home 目录下
echo "[2] Shutdown the remote tomcat" # 关闭远程tomcat
echo "[3] Clear the webapps directory on remote tomcat" # 清空远程webapps目录
echo "[4] Send a app file to webapps/ on the remote tomcat" # 发送一个应用文件文件到远程 webapps 目录中
echo "[5] Send files for the folder on the remote webapps/ROOT" # 发送一个文件目录下的内容到远程 webapps/ROOT 目录中
echo "[6] Start the remote tomcat" # 启动远程Tomcat
echo "[7] Avoid repeat certification" # 免除重复认证
echo
echo  -e "\033[31m[0] EXIT \033[0m" # 退出
echo
read -p "Please input your command:  " command

case ${command} in
    0) break
    ;;
    1)
        ssh ${user}@${host} "tar -zcvf /home/$(date +%Y%m%d)_webapps_bak.tar.gz ${REMOTE_TOMCAT_DIR}/webapps/*"
        read -n1 -p "[-] SUCCESS ${tip}"
    ;;
    2)
        ssh ${user}@${host} "export JAVA_HOME=${REMOTE_JAVA_HOME} && ${REMOTE_TOMCAT_DIR}/bin/shutdown.sh"
        read -n1 -p "[-] SUCCESS ${tip}"
    ;;
    3)
        ssh ${user}@${host} "rm -rf ${REMOTE_TOMCAT_DIR}/webapps/*"
        read -n1 -p "[-] SUCCESS ${tip}"
    ;;
    4)
        scp ${app_file} ${user}@${host}:${REMOTE_TOMCAT_DIR}/webapps/
        read -n1 -p "[-] SUCCESS ${tip}"
    ;;
    5)
        scp -r ${app_dir}  ${user}@${host}:${REMOTE_TOMCAT_DIR}/webapps/ROOT/
        read -n1 -p "[-] SUCCESS ${tip}"
    ;;
    6)
        ssh ${user}@${host} "export JAVA_HOME=${REMOTE_JAVA_HOME} && ${REMOTE_TOMCAT_DIR}/bin/startup.sh"
        read -n1 -p "[-] SUCCESS ${tip}"
    ;;
    7)
        ssh-copy-id ${user}@${host}
        read -n1 -p "[-] SUCCESS ${tip}"
    ;;
    *)
        read -n1 -p "Command invalid ${tip}"
    ;;
esac

done

<<!
 **********************************************************
 * Author        : yangb
 * Email         : yangb92@outlook.com
 * Last modified : 2019-5-7
 * Filename      : z-deploytool
 * Description   : Remote tomcat deploy shell!
 * *******************************************************
!
