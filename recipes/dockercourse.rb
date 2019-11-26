# frozen_string_literal: true

#
# Cookbook:: docker
# Recipe:: default
#
# Copyright:: 2019, Olaf, All Rights Reserved.

git '/root/git' do
  repository 'https://github.com/olsarnow/docker.git'
  reference 'master'
  action :sync
end

git '/root/oracle' do
  repository 'https://github.com/olsarnow/oracleXE-docker.git'
  reference 'master'
  action :sync
end

service 'ssh-guard' do
  action %i[stop disable]
end

cookbook_file '/etc/docker/daemon.json' do
  source 'daemon.json'
  user 'root'
  group 'root'
  mode '0644'
end

bash 'default image size increasing' do
  code <<-EOH
    systemctl daemon-reload
    systemctl restart docker
  EOH
end
