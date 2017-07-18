#!/usr/bin/env bash

#dependencies
yum -y install make zlib-devel pcre-devel openssl-devel

useradd -r nginx

mkdir src
_pwd=`pwd`
cd ../assets

tar -xzf nginx* -C ${_pwd}/src
cd ${_pwd}/src

src_dir=${_pwd}/src/nginx
mv nginx* ${src_dir}
cd ${src_dir}

ln -s auto/configure configure

./configure \
	--user=nginx \
	--group=nginx \
	--prefix=/usr/local/nginx \
	--sbin-path=/usr/sbin/nginx \
	--conf-path=/etc/nginx/nginx.conf \
	--pid-path=/var/run/nginx.pid \
	--lock-path=/var/run/nginx.lock \
	--error-log-path=/var/log/nginx/error.log \
	--http-log-path=/var/log/nginx/access.log \
	--with-http_gzip_static_module \
	--with-http_stub_status_module \
	--with-http_ssl_module \
	--with-pcre \
	--with-file-aio \
	--with-http_realip_module \
	--with-http_scgi_module \
	--with-http_uwsgi_module \
	--with-http_fastcgi_module

make
make install

wget -O /etc/init.d/nginx https://gist.github.com/sairam/5892520/raw/b8195a71e944d46271c8a49f2717f70bcd04bf1a/etc-init.d-nginx

chmod +x /etc/init.d/nginx

chkconfig --add nginx

chkconfig --level 345 nginx on

service nginx start
