#!/bin/bash
yum -y install epel-release;
yum clean all;
yum repolist;
yum -y update
yum -y install vagrant VirtualBox-5.1
rpm -qa | grep -i vagrant
rpm -qa | grep -i virtualbox
