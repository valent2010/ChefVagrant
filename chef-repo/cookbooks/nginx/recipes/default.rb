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

web_servers = search(:node, 'role:"webserver"')

template "/etc/nginx/nginx.conf" do
	source "nginx.conf.erb"
	mode "0644"
	
	notifies :restart, "service[nginx]"
    	variables(
        	:web_servers => web_servers
    	)
end

service "nginx" do
	
	action [ :enable, :start ]
end
