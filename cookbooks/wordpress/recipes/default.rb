#
# Cookbook Name:: wordpress
# Recipe:: default
#

if ['solo', 'app', 'app_master'].include?(node[:instance_role])

  node[:applications].each do |app_name,data|
    user = node[:users].first

    template "/data/#{app_name}/current/wp-config.php" do
      owner user[:username]
      group user[:username]
      mode 0644
      source "wp-config.php.erb"
      variables({
        :app_name => app_name,
        :dbpass => node[:users].first[:password]
      })
      not_if "/data/#{app_name}/current/"
    end

    template "/etc/nginx/servers/#{app_name}-chef.conf" do
      owner user[:username]
      group user[:username]
      mode 0644
      source "wordpress.conf.erb"
      variables({
        :app_name => app_name
      })
    end
  
    execute "start-php" do
      command "/usr/bin/spawn-fcgi -f /usr/bin/php-cgi -a 127.0.0.1 -p 9000 -P /var/run/fastcgi-php.pid"
      action :run
      not_if "netstat -lnp | grep 9000"
    end
  end
end