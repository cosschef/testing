#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

package "httpd" do
	action :install
end

#service "httpd" do
#	action [:enable,:start]
#end

template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	owner "root"
	group "root"
	mode  "644"
end
cookbook_file "/var/www/html/index.html" do
	source "index.html"
end

#user 'nagedrareddy' do
#	action :create
#end

puts "Displaying Port"
apache_port = "#{node['apache']['port']}"
puts "My apache port is: #{apache_port}"

ipaddress_node =  "#{node['ipaddress']}"
puts "My ipaddrss is #{ipaddress_node}"

service "httpd" do
	action :restart
end

include_recipe "apache::ntp"
