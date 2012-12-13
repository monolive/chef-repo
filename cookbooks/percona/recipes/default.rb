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

# Stealing HAProxy logic
# Create list of server which are using percona recipe and sharing clustername
cluster_members = search("node", "role:percona AND percona_wsrep_cluster_name:#{node['percona']['wsrep_cluster_name']}") || []
#cluster_members << node if node.run_list.roles.include?("percona")

# we prefer connecting via local_ipv4 if
# pool members are in the same cloud
# TODO refactor this logic into library...see COOK-494
cluster_members.map! do |member|
  server_ip = begin
    if member.attribute?('cloud')
      if node.attribute?('cloud') && (member['cloud']['provider'] == node['cloud']['provider'])
        "gcomm://#{member['cloud']['local_ipv4']}:#{node['percona']['wsrep_port']},"
      else
        "gcomm://#{member['cloud']['public_ipv4']}:#{node['percona']['wsrep_port']},"
      end
    else
      "gcomm://#{member['ipaddress']}:#{node['percona']['wsrep_port']},"
    end
  end
end

cluster_members = "gcomm://" if not cluster_members.any?

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
directory "#{node['percona']['datadir']}" do
  owner "root"
  group "root"
  recursive true
  action :create
end

# Initialize DB
execute "mysql_install_db --datadir=#{node['percona']['datadir']} --user=#{node['percona']['user']}" do
  creates "#{node['percona']['datadir']}/mysql"
end

# Generate configuration
template "/etc/my.cnf" do
  source "my.cnf.erb"
  mode 0644
  owner "root"
  group "root"
  variables(
    :cluster_members => cluster_members
  )
end

