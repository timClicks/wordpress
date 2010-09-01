# before_restart.rb

# launch custom chef recipes
run "echo file_cache_path '\"#{release_path}/deploy/chef/recipes\"' > #{release_path}/deploy/chef/chef.rb"
sudo "export APP_NAME=#{File.basename(File.dirname(release_dir))} && /usr/local/ey_resin/bin/chef-solo -j /etc/chef/dna.json -c #{release_path}/deploy/chef/chef.rb"


