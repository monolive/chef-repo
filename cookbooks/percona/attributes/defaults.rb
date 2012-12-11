#
# Author:: Olivier Renault (<monoliv@gmail.com>)
# Cookbook Name:: percona
# Attributes:: default
#

default['percona']['gpgkey'] = "http://www.percona.com/redir/downloads/percona-release/RPM-GPG-KEY-percona"
default['percona']['url_release'] = "http://repo.percona.com/centos/$releasever/os/$basearch/"
default['percona']['url_testing'] = "http://repo.percona.com/testing/centos/$releasever/os/$basearch/"
