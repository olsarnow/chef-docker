# frozen_string_literal: true

#
# Cookbook:: docker
# Recipe:: default
#
# Copyright:: 2019, Olaf, All Rights Reserved.

apt_update

package 'apt-transport-https'
package 'ca-certificates'
package 'curl'
package 'software-properties-common'

execute 'apt-key' do
  command 'apt-key fingerprint 0EBFCD88'
end

bash 'make curl request' do
  code <<-EOH
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  EOH
end

bash 'add repo' do
  code <<-EOH
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
  EOH
end

execute 'apt-repo' do
  command 'apt-get update'
end

execute 'apt-repo' do
  command 'apt-get install docker-ce -y --allow-unauthenticated'
end

package 'docker-compose' do
  action :install
end

service 'docker' do
  action %i[start enable]
end
