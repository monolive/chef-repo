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

# Create list of server which are using percona recipe and sharing clustername
cluster_members = search("node", "role:percona AND node:#{node['percona']['cluster_name']}")
toto = search("node", "role:percona")
# remove mysql-libs as it conflict w/ percona server pkg
# it will also remove redhat-lsb as a dependency
# we will reinstall it afterward
package "mysql-libs" do 
  action :remove
end

package "Percona-XtraDB-Cluster-server" 
package "Percona-XtraDB-Cluster-client"
package "redhat-lsb"

# Create data directory
directory "#{node['percona']['mysql_data']}" do
  owner "root"
  group "root"
  recursive true
  action :create
end

# Initialize DB
execute "mysql_install_db --datadir=#{node['percona']['mysql_data']} --user=#{node['percona']['mysql_user']}" do
  creates "#{node['percona']['mysql_data']}/mysql"
end

# Generate configuration
template "/etc/my.cnf" do
  source "my.cnf.erb"
  mode 0644
  owner "root"
  group "root"
  variables(
    :cluster_members => cluster_members,
    :toto => toto
  )
end

