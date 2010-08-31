# rename the auto-generated application config so the wordpress config can replace it
sudo "mv /etc/nginx/servers/#{app_name}.conf /etc/nginx/servers/#{app_name}.conf.bak"