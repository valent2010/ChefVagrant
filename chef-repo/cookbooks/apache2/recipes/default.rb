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

template "/var/www/html/index.html" do
	source "index.html.erb"
	mode "0644"
end

service "apache2" do
	
	action [ :enable, :start ]
end
