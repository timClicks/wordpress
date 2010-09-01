# deal with monit

sudo "foreach old in (/etc/monit.d/*.monitrc); do new=`echo $old | sed -e 's/monitrc$/monitrc.bak/'`; mv $old $new; done"
sudo "monit quit"

node[:applications].each do |app_name,data|

  # rename the auto-generated application config so the wordpress config can replace it  
  sudo "touch /etc/nginx/servers/#{app_name}.conf && mv /etc/nginx/servers/#{app_name}.conf /etc/nginx/servers/#{app_name}.conf.bak"

end