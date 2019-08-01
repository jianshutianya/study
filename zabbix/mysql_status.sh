#!/bin/bash
case $1 in
connect)
    mysqladmin -uroot -p123qqq...A extended-status --relative  | awk '/Threads_connected/ {print $4}';;
slow)
    mysqldumpslow /var/lib/mysql/mysql-slow.log | awk 'BEGIN{x=0}/^select/{x++}END{print x}';;
select)
    mysqladmin -uroot -p123qqq...A extended-status --relative  | awk '/Com_select /{print $4}';;
delect)
    mysqladmin -uroot -p123qqq...A extended-status --relative  | awk '/Com_delete /{print $4}';; 
update)
    mysqladmin -uroot -p123qqq...A extended-status --relative  | awk '/Com_update /{print $4}';;
insert)
    mysqladmin -uroot -p123qqq...A extended-status --relative  | awk '/Com_insert /{print $4}'
esac
