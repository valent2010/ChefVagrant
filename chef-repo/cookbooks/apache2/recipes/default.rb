#
# Cookbook Name:: apache2
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "apache2" do
	action :install
end

service "apache2" do
	supports :restart => :true
	action [:enable, :start]

end

package "php5" do
	action :install
end

template "/etc/apache2/mods-enabled/dir.conf" do
	source "dir.conf.erb"
	mode "0644"
	notifies :restart, 'service[apache2]', :immediately
end

template "/var/www/html/index.html" do
	source "index.html.erb"
	mode "0644"
end
template "/var/www/html/index.php" do
	source "index.php.erb"
	mode "0644"

end
