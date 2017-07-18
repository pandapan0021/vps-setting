#!/usr/bin/env bash

sudo wget -O /etc/yum.repos.d/slc6-devtoolset.repo http://linuxsoft.cern.ch/cern/devtoolset/slc6-devtoolset.repo
sudo rpm --import http://ftp.scientificlinux.org/linux/scientific/5x/x86_64/RPM-GPG-KEYs/RPM-GPG-KEY-cern
sudo yum install devtoolset-2-gcc-c++-4.8.2-15.1.el6
echo "source /opt/rh/devtoolset-2/enable" >> ~/.bashrc
. ~/.bashrc
