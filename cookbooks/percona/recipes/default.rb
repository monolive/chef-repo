#
# Cookbook Name:: percona
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#

yum_repository "percona" do
  description "Percona RPM repository"
  url "http://repo.percona.com/centos/$releasever/os/$basearch/"
  key "http://www.percona.com/redir/downloads/percona-release/RPM-GPG-KEY-percona"
  action :add
end

yum_repository "percona-testing" do
  description "Percona testing RPM Repository"
  url "http://repo.percona.com/testing/centos/$releasever/os/$basearch/"
  key "http://www.percona.com/redir/downloads/percona-release/RPM-GPG-KEY-percona"
  action :add
end
