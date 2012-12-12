#
# Cookbook Name:: percona
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# TODO : Need to use the gpg keys

release_url = node['percona']['release_url']
testing_url = node['percona']['testing_url']

case node[:platform]
when "redhat", "centos"
  yum_repository "percona" do
    description "Percona RPM repository"
    url release_url
    action :add
  end

  yum_repository "percona-testing" do
    description "Percona testing RPM Repository"
    url testing_url
    action :add
  end

end

# remove mysql-libs as it conflict w/ percona server pkg
# it will also remove redhat-lsb as a dependency
# we will reinstall it afterward
package "mysql-libs" do 
  action :remove
end

package "Percona-XtraDB-Cluster-server" 
package "Percona-XtraDB-Cluster-client"
packahe "redhat-lsb"

# Create data directory
directory "#{node['percona']['mysql_data']}" do
  owner "root"
  group "root"
  recursive true
  action :create
end


