#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

package 'ntp' do
	action :install
end

service 'ntpd' do
	action [:enable,:start]
end
