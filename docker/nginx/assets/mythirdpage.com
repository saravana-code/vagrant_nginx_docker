server {
    listen  80;

    server_name mythirdpage.com www.mythirdpage.com;

    location / {
        root  /var/www/mythirdpage.com/html;
        index  3.html;
        try_files $uri $uri/ =404;
    }

    error_page  500 502 503 504  /50x.html;
    location = /50x.html {
        root  /usr/share/nginx/html;
    }
}
