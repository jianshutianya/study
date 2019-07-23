#!/bin/bash
ssh-keygen -f /root/.ssh/id_rsa -N ''
for i in {51..58}
do
	expect <<EOF
	set timeout -1
	spawn  ssh-copy-id root@192.168.4.$i
	expect "(yes/no)?"
	send "yes\r"
	expect "password:"
	send "123456"
	expect EOF
EOF
done
