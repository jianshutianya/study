#!/bin/bash
rpm -q expect || yum -y install expect
for i in {}
do
	scp /linux-soft/03/redis/redis-4.0.8.tar.gz root@192.168.4.$i:~
	ssh root@192.168.4.$i "
		rpm -q gcc || yum -y install gcc
		tar -xf redis-4.0.8.tar.gz
		cd redis-4.0.8
		make && make install
		/root/redis-4.0.8/utils/install_server.sh < /dev/null
		"
done
