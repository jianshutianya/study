#!/bin/bash
VIP=192.168.4.15
RIP[1]=192.168.4.100
RIP[2]=192.168.4.200
web[1]=919d117956d3135c4c683ff021352f5c
web[2]=c1ba58b05f6245f221ad65391fa6690b
while :
do
    for n in {1..2}
    do
    web=$(curl -s http://${RIP[$n]} | md5sum) &> /dev/null
    web=${web%% *}
    if [ $web == ${web[$n]} ];then
        ipvsadm -Ln | grep -q ${RIP[$n]} || ipvsadm -a -t $VIP -r ${RIP[$n]}
    else
        ipvsadm -Ln | grep -q ${RIP[$n]} && ipvsadm -d -t $VIP -r ${RIP[$n]}
#       echo "网页被篡改" | mail -s '警告' root
    fi
    done
    sleep 10
done
