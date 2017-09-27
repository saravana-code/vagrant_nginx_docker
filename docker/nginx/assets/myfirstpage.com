server {
    listen  80;

    server_name myfirstpage.com www.myfirstpage.com;

    location / {
        root  /var/www/myfirstpage.com/html;
        index  1.html;
        try_files $uri $uri/ =404;
    }

    error_page  500 502 503 504  /50x.html;
    location = /50x.html {
        root  /usr/share/nginx/html;
    }
}
