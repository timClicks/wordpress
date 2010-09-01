# before_restart.rb

node[:applications].each do |app_name,data|

  # launch custom chef recipes
  run "echo file_cache_path '\"#{release_path}/deploy/chef/recipes\"' > #{release_path}/deploy/chef/chef.rb"
  sudo "export APP_NAME=#{File.basename(File.dirname(release_dir))} && export MASTER_APP_NAME=#{master_app_name} && /usr/local/ey_resin/bin/chef-solo -j /etc/chef/dna.json -c #{release_path}/deploy/chef/chef.rb"

end

