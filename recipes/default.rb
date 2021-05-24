#
# Cookbook:: httpd
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
#
#

default['httpd']['application'] = 'httpd'

pkg_name = node['httpd']['application']

package "#{pkg_name}" do
  package_name :httpd
  action :install
end

service "#{pkg_name}" do
  service_name :httpd
  action [:enable, :start]
end

cookbook_file '/var/www/html/index.html' do
  source 'index.html'
  mode '0644'
end
