# Cookbook Name:: grokit
# Recipe:: docker_install
#
# Copyright (c) 2016 Owen Sullivan, All Rights Reserved.
Chef::Log.info("********** Installing Docker **********")

case node[:platform]
when 'centos','redhat','fedora','amazon'
  package "docker" do
    action :install
  end
when "ubuntu","debian"
  package "docker.io" do
    action :install
  end
end

service "docker" do
  action :start
end

group "docker" do
  action :modify
  members "ec2-user"
  append true
end

Chef::Log.info("********** Installing Git **********")
case node[:platform]
when 'centos','redhat','fedora','amazon'
  package "git" do
    action :install
  end
when "ubuntu","debian"
  package "git.io" do
    action :install
  end
end

Chef::Log.info("********** Git cloning docker-nagios **********")
execute "Create an SSH key" do
  command "git clone https://github.com/cpuguy83/docker-nagios"
end 
