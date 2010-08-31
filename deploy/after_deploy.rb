sudo "mv /etc/nginx/servers/#{app_name}.conf /etc/nginx/servers/#{app_name}.conf.bak"
sudo "/etc/init.d/nginx restart"