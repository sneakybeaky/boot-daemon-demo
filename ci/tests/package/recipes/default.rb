#
# Cookbook:: spring-boot-demo
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'java::default'

remote_file '/tmp/boot_daemon.deb' do
  source node[:boot_daemon][:package_url]
  action :create
end


dpkg_package 'daemon-demo' do
    options '--force-architecture'
    source '/tmp/boot_daemon.deb'
end

service "daemon-demo" do
  action [ :enable, :start ]
end