#!/bin/bash
file=/usr/local/nginx/conf/nginx.conf
yum -y install gcc pcre-devel openssl-devel
tar -xf /root/lnmp_soft.tar.gz
cd /root/lnmp_soft
tar -xf /root/lnmp_soft/nginx-1.12.2.tar.gz
cd /root/lnmp_soft/nginx-1.12.2
useradd -s /sbin/nologin nginx
./configure --user=nginx --group=nginx --with-http_ssl_module --with-stream --with-http_stub_status_module
make && make install 
ln -s /usr/local/nginx/sbin/nginx /sbin/
echo "/usr/local/nginx/sbin/nginx" >> /etc/rc.local
chmod +x /etc/rc.local
systemctl stop httpd
systemctl disable httpd
/usr/local/nginx/sbin/nginx
yum -y install php php-fpm php-mysql
yum -y install mariadb mariadb-server mariadb-devel
systemctl start php-fpm
systemctl enable php-fpm
systemctl start mariadb
systemctl enable mariadb
sed -i '45s/index\.html/index.php/' $file
sed -i '65,71s/#//' $file
sed -i '/SCRIPT_FILENAME/d' $file
sed -i '/fastcgi_params/s/_params/.conf/' $file
