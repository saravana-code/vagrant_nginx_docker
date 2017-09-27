server {
    listen  80;

    server_name mysecondpage.com www.mysecondpage.com;

    location / {
        root  /var/www/mysecondpage.com/html;
        index  2.html;
        try_files $uri $uri/ =404;
    }

    error_page  500 502 503 504  /50x.html;
    location = /50x.html {
        root  /usr/share/nginx/html;
    }
}
