# Cookbook Name:: grokit
# Recipe:: grokit_install
#
# Copyright (c) 2016 Owen Sullivan, All Rights Reserved.
Chef::Log.info("********** Installing Grokit **********")

directory "Create home directory" do
  group "root"
  mode "0755"
  owner "ec2-user"
  path "/opt/grokit"  
end

remote_file '/opt/grokit/Grokit.rb' do
  source 'https://s3-us-west-2.amazonaws.com/grokit/Grokit.rb'
  group "root"
  mode "0755"
  owner "ec2-user"
  action :create
end

remote_file '/opt/grokit/test.log' do
  source 'https://s3-us-west-2.amazonaws.com/grokit/test.log'
  group "root"
  mode "0755"
  owner "ec2-user"
  action :create
end

execute "Running Grokit" do
  command "ruby /opt/grokit/Grokit.rb"
end 

