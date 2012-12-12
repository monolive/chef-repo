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

  # Install packages
  package "Percona-XtraDB-Cluster-server" 
  package "Percona-XtraDB-Cluster-client"
end



