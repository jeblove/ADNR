# Automatically detects network restart

#### 介绍
用于路由器检测网络，若网络不通，自动重启网络服务，配合其它有需服务使用

#### 软件架构
利用shell脚本

#### 安装教程

1、配置ADNR

下载脚本ADNR.sh

wget -P ~/UserSetting https://gitee.com/jeblove/ADNR/raw/master/ADNR.sh

设置权限

chmod a+x ~/UserSetting/ADNR.sh

2、设置ADNR开机启动

方法一：每隔1分钟检测一遍

crontab -e

添加下面一行代码

* * * * * ~/UserSetting/ADNR.sh

保存即可

方法二：每隔30秒检测一遍

wget -P ~/UserSetting https://gitee.com/jeblove/ADNR/raw/master/SADNR.sh

设置权限

chmod a+x ~/UserSetting/SADNR.sh

crontab -e

添加下面一行代码

@reboot ~/UserSetting/SADNR.sh

保存，重启路由器

(方法二可以修改脚本SADNR.sh里的sleep 30为自定义的时间，单位为秒)

3、检测状态

查询进程是否在运行

ps -ef | grep ADNR

或

在路由器日志里看到

user.notice root: network is ok

为此已经正常运行

#### 使用说明

网络不通，自动检测重启
若是断网，该脚本休眠5分钟，以防离线无限重启
离线情况下需要及时关闭


