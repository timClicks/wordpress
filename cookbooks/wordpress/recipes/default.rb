#
# Cookbook Name:: wordpress
# Recipe:: default
#

if ['solo', 'app', 'app_master'].include?(node[:instance_role])

  node[:applications].each do |app_name,data|
    user = node[:users].first

    template "/data/#{app_name}/shared/config/wp-config.php" do
      owner user[:username]
      group user[:username]
      mode 0644
      source "wp-config.php.erb"
      variables({
        :app_name => app_name,
        :dbpass => node[:users].first[:password]
      })
      not_if "ls /data/#{app_name}/current/"
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
  end
end