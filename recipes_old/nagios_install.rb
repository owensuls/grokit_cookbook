# Cookbook Name:: grokit
# Recipe:: nagios
#
# Copyright (c) 2016 Owen Sullivan, All Rights Reserved.
Chef::Log.info("********** Installing Nagios **********")

application "Nagios Dependancies" do
  package "nethack.x86_64"
end

package "Install Nagios " do
  package_name "emacs"
end


yum install httpd php
yum install gcc glibc glibc-common
yum install gd gd-devel

execute "Running Grokit" do
  command "ruby /opt/grokit/Grokit.rb"
end 

