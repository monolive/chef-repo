Description
===========
Install and configure Percona http://www.percona.com
Following the description available at
http://www.percona.com/doc/percona-xtradb-cluster/howtos/3nodesec2.html

Requirements
============

. CentOS 6

Attributes
==========

Usage
=====
recipe[percona] should install a percona node 

Known problems
==============
We are using wsrep_urls instead of wsrep_cluster_address
It's not starting cluster automatically ( mysqld_safe is suggested in article)

