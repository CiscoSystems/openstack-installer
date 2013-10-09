#!/bin/bash
#
# This script sets up the base config for all nodes
# It requires that you provide it with the ip address
# of your build server
# export build_server_ip=10.0.0.1
# bash setup.sh
#
set -u
set -x

apt-get update
apt-get install -y git apt rubygems puppet

# use the domain name if one exists
if [ `hostname -d` != '' ]; then
  domain=`hostname -d`
else
  # otherwise use the domain
  domain='domain.name'
fi
# puppet's fqdn fact explodes if the domain is not setup
if grep 127.0.1.1 /etc/hosts ; then
  sed -i -e "s/127.0.1.1.*/127.0.1.1 $(hostname).$domain $(hostname)/" /etc/hosts\n
else
  echo "127.0.1.1 $(hostname).$domain $(hostname)" >> /etc/hosts
fi;

# Install openstack-installer
cd /root/
if ! [ -f openstack-installer ]; then
  git clone https://github.com/robertstarmer/openstack-installer.git /root/openstack-installer
fi

cd openstack-installer
gem install librarian-puppet-simple --no-ri --no-rdoc
export git_protocol='https'
librarian-puppet install --verbose

export FACTER_build_server_domain_name=$domain
export FACTER_build_server_ip=$build_server_ip

puppet apply manifests/master.pp --modulepath modules

cp -Rv /root/openstack-installer/modules /etc/puppet/
cp -Rv /root/openstack-installer/data /etc/puppet/
cp -Rv /root/openstack-installer/manifests /etc/puppet/

puppet apply /etc/puppet/manifests/site.pp --certname build-server --debug
