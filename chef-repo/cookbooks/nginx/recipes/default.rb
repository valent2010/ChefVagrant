#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "nginx" do
	action :install
end

template "/etc/nginx/nginx.conf" do
	source "nginx.conf.erb"
	mode "0644"
end

service "nginx" do
	
	action [ :enable, :start ]
end
