#!/bin/bash
#界面修改模块：color函数

#根据输入颜色信息修改界面颜色
color()
{
    case $1 in
    black_green) #黑底绿字
        echo -e "\033[40;32m"
        ;;
    black_yellow) #黑底黄字
        echo -e "\033[40;33m"
        ;;
    black_white) #黑底白字
        echo -e "\033[40;37m"
        ;;
    black_blue) #黑底蓝字
        echo -e "\033[40;34m"
        ;;
    *) #默认为黑底白字
        echo -e "\033[30;37m"
        ;;
    esac
}

#############################################################
#主菜单模块

#清屏
echo -e "\033[2J"
#设置信号处理
trap "" 1 2 3
#日期信息
date=`date +%d/%m/%y`
#机器名信息
host=`hostname`
#当前用户信息
user=`whoami`

#循环显示主菜单
while :
do
    #显示主菜单，menu作为cat命令的结束符
    cat <<menu
    ---------------------------------------------------
        $user    $host    $date
    ---------------------------------------------------
            1：改变字体颜色
            2：查看进程信息
            3：查看用户信息
            h：帮助
            q：退出
    ---------------------------------------------------
menu
#cat命令结束
   
    #提示用户输入选项
    echo -e -n "\t请输入您的选择【1,2,3,h,q】："
    #读取用户输入的选择项
    read choice
    #判断choice值
    case $choice in
    1) #用户输入1
        #while循环，接收用户输入的颜色选择
        while :
        do
    #显示颜色选择菜单
    cat <<menu_color
    ---------------------------------------------------
        $user    $host    $date
    ---------------------------------------------------
        1：黑绿    2：黑黄    3：黑白    4：黑蓝    0：返回
    ---------------------------------------------------
menu_color
#cat命令结束
            #提示用户输入颜色选项
            echo -e -n "\t请输入选择的颜色【1，2，3，4，0】："
            #读取用户的输入
            read choice_color
            #判断用户输入的颜色选项
            case $choice_color in
            1) #用户输入1
                #调用color函数设置颜色
                color black_green
                ;;
            2) #用户输入2
                #调用color函数设置颜色
                color black_yellow
                ;;
            3) #用户输入3
                #调用color函数设置颜色
                color black_white
                ;;
            4) #用户输入4
                #调用color函数设置颜色
                color black_blue
                ;;
            0) #用户输入0
                #退出当前菜单
                break
                ;;
            *) #用户输入其它任意值
                #输入错误，清屏继续等待输入
                echo -e "\033[2J"
                echo -e "\tInput error! Please input again!"
                continue
                ;;
            #case结束
            esac
           
            clear
        #while结束
        done
        ;;
       
#############################################################
#查看进程信息模块

    2) #用户输入2
        #调用ps命令查看进程信息
        ps aux|sort -m|head -10
        ;;
       
#############################################################
#查看用户信息模块

    3) #用户输入3
        #调用who命令查看用户信息
        who
        ;;
       
#############################################################
#帮助模块
       
    H|h) #用户输入H或h
        #调用cat显示帮助信息
        cat <<menu_help
        选择“改变字体颜色“可以修改当前界面的字体颜色
        选择“查看进程信息“可以获取当前占用资源最高的前10个进程
        选择“查看用户信息“可以获取当前登录系统的用户信息
menu_help
#cat命令结束
        ;;
       
    Q|q) #用户输入Q或q
        #推出主程序
        exit 0
        ;;
    *) #用户输入其他值
        #输入错误，清屏继续等待输入
        echo -e "\033[2J"
        echo -e "\tInput error! Please input again!"
        continue
        ;;
    #case语句结束
    esac
    #执行完命令后的提示
    echo -e -n "\t按任意键继续..."
    read anykey
    clear
#while循环结束
done