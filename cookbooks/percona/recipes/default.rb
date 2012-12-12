#
# Cookbook Name:: percona
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#

include_recipe"yum::yum" 

key         = node['percona']['key']
key_url     = node['percona']['key_url']
release_url = node['percona']['release_url']
testing_url = node['percona']['testing_url']

yum_key "#{key}" do 
  url "#{key_url}"
  action :add 
end

yum_repository "percona" do
  description "Percona RPM repository"
  url "#{release_url}"
  key "#{key}"
  action :add
end

yum_repository "percona-testing" do
  description "Percona testing RPM Repository"
  url "#{testing_url}"
  key "#{key}"
  action :add
end
