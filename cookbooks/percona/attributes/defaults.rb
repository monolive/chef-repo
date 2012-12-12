#
# Author:: Olivier Renault (<monoliv@gmail.com>)
# Cookbook Name:: percona
# Attributes:: default
#

# Repository information
# GPG key information are currently unused
default['percona']['key_url'] = "http://www.percona.com/redir/downloads/percona-release/RPM-GPG-KEY-percona"
default['percona']['key'] = "RPM-GPG-KEY-percona"
default['percona']['release_url'] = "http://repo.percona.com/centos/$releasever/os/$basearch/"
default['percona']['testing_url'] = "http://repo.percona.com/testing/centos/$releasever/os/$basearch/"

# Configuration
default['percona']['mysql_data'] = "/percona/data"
default['percona']['mysql_user'] = "mysql"

