# remove monit from the equation
sudo "mv /etc/monit.d /etc/montd.d.bak"
sudo "mkdir /etc/monit.d/"
sudo "monit quit"

node[:applications].each do |app_name,data|

  # rename the auto-generated application config so the wordpress config can replace it  
  sudo "mv /etc/nginx/servers/#{app_name}.conf /etc/nginx/servers/#{app_name}.conf.bak"

end