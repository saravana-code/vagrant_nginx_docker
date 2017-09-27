# source
FROM centos:7

# Versions of Nginx and nginx-rtmp-module to use
ENV NGINX_VERSION 1.11.9
ENV NGINX_USER nginx

# install needed packages

RUN yum -y install epel-release \
 && rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm \
 && yum -y update \
 && yum -y install \
      gcc gcc-c++ make \
      pcre-devel zlib-devel \
      bind-utils \
      curl \
      iproute \
      net-tools \
      tcpdump \
      openssl openssl-devel \
      wget \
      ffmpeg \
 && yum clean all


# Download and decompress Nginx
# Download and decompress RTMP module
# Build and install Nginx
# The default puts everything under /usr/local/nginx, so it's needed to change
# it explicitly. Not just for order but to have it in the PATH
# Then clean up build
RUN mkdir -p /tmp/build/nginx && \
    cd /tmp/build/nginx && \
    wget -O nginx-${NGINX_VERSION}.tar.gz https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
    tar -zxf nginx-${NGINX_VERSION}.tar.gz && \
    cd /tmp/build/nginx/nginx-${NGINX_VERSION} && \
    ./configure \
        --sbin-path=/usr/local/sbin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/var/log/nginx/error.log \
        --pid-path=/var/run/nginx/nginx.pid \
        --lock-path=/var/lock/nginx/nginx.lock \
        --http-log-path=/var/log/nginx/access.log \
        --http-client-body-temp-path=/tmp/nginx-client-body \
        --with-http_ssl_module \
        --with-threads \
        --add-module=/tmp/build/nginx-rtmp-module/nginx-rtmp-module-${NGINX_RTMP_MODULE_VERSION} && \
    make -j $(getconf _NPROCESSORS_ONLN) && \
    make install && \
    mkdir /var/lock/nginx && \
    cd /tmp && rm -rf /tmp/build

# Forward logs to Docker
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

# Assets Directory
RUN mkdir /etc/nginx/sites-available
RUN mkdir /etc/nginx/sites-enabled
RUN mkdir -p /var/www/myfirstpage.com/html
RUN mkdir -p /var/www/mysecondpage.com/html
RUN mkdir -p /var/www/mythirdpage.com/html


# Set up config files
COPY  

# Open ports
EXPOSE 80 8080

CMD ["nginx"]

# vim: tabstop=2 shiftwidth=2 softtabstop=2 expandtab


