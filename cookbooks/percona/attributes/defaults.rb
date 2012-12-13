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
default['percona']['user'] = "mysql"
default['percona']['datadir'] = "/percona/data"
default['percona']['basedir'] = "/usr"
default['percona']['socket'] = "/var/lib/mysql/mysql.sock"
default['percona']['pid-file'] = "mysqld.pid"
default['percona']['port'] = "3306"
default['percona']['log-error'] = "error.log"
default['percona']['wsrep_cluster_name'] = "mycluster"
default['percona']['wsrep_port'] = "4567"

