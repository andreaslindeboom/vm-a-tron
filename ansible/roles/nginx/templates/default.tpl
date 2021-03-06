server {
    listen  80;

    root {{ server_document_root }};
    index index.html index.php;

    server_name {{ server_name }} {{ ansible_eth1.ipv4.address }};

    include hhvm.conf;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    error_page 404 /404.html;

    error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        root /usr/share/nginx/www;
    }
}
