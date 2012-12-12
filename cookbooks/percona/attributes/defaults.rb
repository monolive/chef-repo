#
# Author:: Olivier Renault (<monoliv@gmail.com>)
# Cookbook Name:: percona
# Attributes:: default
#

default['percona']['key_url'] = "http://www.percona.com/redir/downloads/percona-release/RPM-GPG-KEY-percona"
default['percona']['key'] = "RPM-GPG-KEY-percona"
default['percona']['release_url'] = "http://repo.percona.com/centos/$releasever/os/$basearch/"
default['percona']['testing_url'] = "http://repo.percona.com/testing/centos/$releasever/os/$basearch/"
