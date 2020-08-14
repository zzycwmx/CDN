#!/bin/bash
clear
echo "使用方法: wget vpstest.cn/it && bash it 或 wget git.io/vpstest && bash vpstest"
DIR=${HOME}/vpstest
if [ ! -d $DIR ];then
    mkdir $DIR
fi
trap "cl" 2
cl () {
    echo ""
    echo "clear it ..."
    rm -f it
    echo "OK"
    exit 0
}
# copy from superbench
if [ -f /etc/redhat-release ]; then
	    release="centos"
elif cat /etc/issue | grep -Eqi "debian"; then
	    release="debian"
elif cat /etc/issue | grep -Eqi "ubuntu"; then
	    release="ubuntu"
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
	    release="centos"
elif cat /proc/version | grep -Eqi "debian"; then
	    release="debian"
elif cat /proc/version | grep -Eqi "ubuntu"; then
	    release="ubuntu"
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
	    release="centos"
fi
# id=0
# if [ ! $# -eq 0 ];then
#     id=$1
# fi
while [ 1 -eq 1 ];do
echo "请选择需要测试的脚本序号:"
echo "1. bench.sh"
echo "2. LemonBench"
echo "3. superspeed"
echo "4. superbench修复版"
echo "5. 91yuntest"
echo "6. ZBench"
echo "7. superbench修复+多节点版"
echo "8. UnixBench"
echo "9. GeekBench5"
echo "10.kos回程测试"
echo "11.超内存测试"
echo "12.路由测试(需提供目标ip)"
echo "0. 退出"
read id
case $id in
    0)
        break
        ;;
    1)
        wget -qO- http://bench.sh | bash
        ;;
    2)
        if [ ! -f ${DIR}/LemonBench.sh ]; then
            curl -fsL https://ilemonra.in/LemonBenchIntl > ${DIR}/LemonBench.sh
        fi
        bash ${DIR}/LemonBench.sh fast
        ;;
    3)
        while [ ! -f ${DIR}/superspeed.sh ]; do
            wget -P ${DIR} --no-check-certificate https://raw.githubusercontent.com/ernisn/superspeed/master/superspeed.sh
        done
        bash ${DIR}/superspeed.sh
        ;;
    4)
        while [ ! -f ${DIR}/superbench.sh ]; do
            wget -P ${DIR} --no-check-certificate https://raw.githubusercontent.com/msoayu56/speedtest/master/superbench.sh
        done
        bash ${DIR}/superbench.sh
        ;;
    5)
        while [ ! -f ./test.sh ]; do
            wget -N --no-check-certificate https://raw.githubusercontent.com/91yun/91yuntest/master/test.sh
        done
        echo "91yuntest:请选择需要测试的项目序号(以空格分开)"
        echo "1.io 2.bandwidth 3.chinabw 4.download 5.traceroute 6.backtraceroute 7.allping 8.gotoping 9.benchtest"
        arr=("io," "bandwidth," "chinabw," "download," "traceroute," "backtraceroute," "allping," "gotoping," "benchtest,")
        read -r m
        st=""
        for i in $m ; do
            st=${st}${arr[$(($i-1))]}
        done
        # st=\"${st%,*}\"
        # echo $st
        # bash ${DIR}/91yuntest.sh -i "io,bandwidth,chinabw,download,traceroute,backtraceroute,allping,gotoping,benchtest"
        bash ./test.sh -i $st
        ;;
    6)
        while [ ! -f ${DIR}/ZBench-CN.sh ]; do
            wget -N -P ${DIR} --no-check-certificate https://raw.githubusercontent.com/FunctionClub/ZBench/master/ZBench-CN.sh
        done
        bash ${DIR}/ZBench-CN.sh
        ;;
    7)
        while [ ! -f ${DIR}/speedtest.sh ]; do
            wget -N -P ${DIR} --no-check-certificate https://raw.githubusercontent.com/zzycwmx/CDN/master/speedtest.sh
        done
        bash ${DIR}/speedtest.sh
        ;;
    8)
        while [ ! -f ${DIR}/unixbench.sh ]; do
            wget -P ${DIR} --no-check-certificate https://github.com/teddysun/across/raw/master/unixbench.sh && chmod +x ${DIR}/unixbench.sh
        done
        ${DIR}/unixbench.sh
        ;;
    9)
        while [ ! -d ${DIR}/Geekbench-5.2.3-Linux ]; do
            wget -P ${DIR} http://cdn.geekbench.com/Geekbench-5.2.3-Linux.tar.gz && tar -xzvf ${DIR}/Geekbench-5.2.3-Linux.tar.gz -C ${DIR}
        done
        ${DIR}/Geekbench-5.2.3-Linux/geekbench5
        ;;
    10)
        if [ -f ${DIR}/kos ]; then
            wget -q kos.f2k.pub -O ${DIR}/kos
        fi
        sh ${DIR}/kos
        ;;
    11)
        if [ $release == "centos" ]; then
            yum install wget -y
            yum groupinstall "Development Tools" -y
        else
            apt-get -y update
            apt-get install wget build-essential -y
        fi
        while [ ! -f ${DIR}/memtester.out ]; do
            wget --no-check-certificate -P ${DIR} https://raw.githubusercontent.com/FunctionClub/Memtester/master/memtester.cpp
            g++ -l stdc++ ${DIR}/memtester.cpp -o ${DIR}/memtester.out
        done
        ${DIR}/memtester.out
        ;;
    12)
        if [ $release == "centos" ]; then
            yum install wget unzip -y
        else
            apt-get -y update
            apt-get install wget unzip -y
        fi
        while [ ! -f ${HOME}/vpstest/besttrace ]; do
            wget https://cdn.ipip.net/17mon/besttrace4linux.zip && unzip besttrace4linux.zip -d ${HOME}/vpstest/ && rm -f besttrace4linux.zip
        done
        read -p "请输入目标IP:" ip
        ${HOME}/vpstest/besttrace -q 1 ip
        ;;
    *)
        clear
        echo "请重新选择"
esac
done
rm -f it
