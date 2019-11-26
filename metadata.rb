name 'docker'
maintainer 'Olaf'
maintainer_email 'olaf@sarnow.no'
description 'Installs/Configures docker'
long_description 'Installs/Configures docker'
version '0.16.0'
chef_version '>= 14.0'
license 'GPL-3.0'
issues_url 'https://github.com/olsarnow/chef_general/issues'
source_url 'https://github.com/olsarnow/chef_general/docker'
%w( debian ubuntu ).each do |os|
  supports os
end




# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/docker/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/docker'
