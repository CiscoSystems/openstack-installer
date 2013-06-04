# the account where the Openstack modules should come from
#
# this file also accepts a few environment variables
#
git_protocol=ENV['git_protocol'] || 'git'

#
# this modulefile has been configured to use two sets of repos.
# The downstream repos that Cisco has forked, or the upstream repos
# that they are derived from (and should be maintained in sync with)
#


#
# this is just targeting the upstream stackforge modules
# right now, and the logic for using downstream does not
# work yet
#

if ENV['repos_to_use']  == 'downstream'
  # this assumes downstream which is the Cisco branches
  branch_name              = 'origin/grizzly'
  openstack_module_branch  = branch_name
  openstack_module_account = 'CiscoSystems'
else
  # use the upstream modules where they exist
  branch_name              = 'origin/grizzly'
  openstack_module_branch  = 'master'
  openstack_module_account = 'stackforge'
end

base_url = "#{git_protocol}://github.com"

#
# Installer Manifests
#
user_name = 'bodepd'
release = 'grizzly'
manifest_branch = 'master'
mod 'manifests', :git => "#{base_url}/#{user_name}/#{release}-manifests", :ref => manifest_branch

#
# the stackforge openstack modules
#

openstack_repo_prefix = "#{base_url}/#{openstack_module_account}/puppet"

mod 'stackforge/openstack', :git => "#{openstack_repo_prefix}-openstack", :ref => openstack_module_branch
# openstack core modules
mod 'stackforge/cinder',    :git => "#{openstack_repo_prefix}-cinder",    :ref => openstack_module_branch
mod 'stackforge/glance',    :git => "#{openstack_repo_prefix}-glance",    :ref => openstack_module_branch
mod 'stackforge/keystone',  :git => "#{openstack_repo_prefix}-keystone",  :ref => openstack_module_branch
mod 'stackforge/horizon',   :git => "#{openstack_repo_prefix}-horizon",   :ref => openstack_module_branch
mod 'stackforge/nova',      :git => "#{openstack_repo_prefix}-nova",      :ref => openstack_module_branch
mod 'stackforge/quantum',   :git => "#{openstack_repo_prefix}-quantum",   :ref => openstack_module_branch
mod 'stackforge/swift',     :git => "#{openstack_repo_prefix}-swift",     :ref => openstack_module_branch

#
# the rest of the modules just come straight from their respective Cisco branches at the moment.
#

#
# coe specific modules
#
mod 'CiscoSystems/coe', :git => "#{base_url}/CiscoSystems/puppet-coe", :ref => 'origin/grizzly'
mod 'CiscoSystems/openstack_admin', :git => "#{base_url}/CiscoSystems/puppet-openstack_admin", :ref => 'origin/grizzly'


# middleware modules
mod 'CiscoSystems/apache', :git => "#{base_url}/CiscoSystems/puppet-apache", :ref => branch_name
mod 'CiscoSystems/memcached', :git => "#{base_url}/CiscoSystems/puppet-memcached", :ref => branch_name
#
# I cannot remember if this is necessary
#
mod 'CiscoSystems/mysql', :git => "#{base_url}/CiscoSystems/puppet-mysql", :ref => 'master'
mod 'CiscoSystems/rabbitmq', :git => "#{base_url}/CiscoSystems/puppet-rabbitmq", :ref => branch_name

# linux tools
mod 'CiscoSystems/apt', :git => "#{base_url}/CiscoSystems/puppet-apt", :ref => branch_name
mod 'CiscoSystems/apt-cacher-ng', :git => "#{base_url}/CiscoSystems/puppet-apt-cacher-ng", :ref => branch_name
#
# TODO - this is still pointing at my fork
#
mod 'CiscoSystems/cobbler', :git => "#{base_url}/bodepd/puppet-cobbler", :ref => 'origin/fix_cobbler_sync_issue'
mod 'CiscoSystems/collectd', :git => "#{base_url}/CiscoSystems/puppet-collectd", :ref => branch_name
mod 'CiscoSystems/corosync', :git => "#{base_url}/CiscoSystems/puppet-corosync", :ref => branch_name
mod 'CiscoSystems/dnsmasq', :git => "#{base_url}/CiscoSystems/puppet-dnsmasq", :ref => branch_name
mod 'CiscoSystems/drbd', :git => "#{base_url}/CiscoSystems/puppet-drbd", :ref => branch_name
mod 'CiscoSystems/graphite', :git => "#{base_url}/CiscoSystems/puppet-graphite", :ref => branch_name
mod 'CiscoSystems/monit', :git => "#{base_url}/CiscoSystems/puppet-monit", :ref => branch_name
mod 'CiscoSystems/naginator', :git => "#{base_url}/CiscoSystems/puppet-naginator", :ref => branch_name
mod 'CiscoSystems/ntp', :git => "#{base_url}/CiscoSystems/puppet-ntp", :ref => branch_name
mod 'CiscoSystems/pip', :git => "#{base_url}/CiscoSystems/puppet-pip", :ref => branch_name
mod 'CiscoSystems/puppet', :git => "#{base_url}/CiscoSystems/puppet-puppet", :ref => branch_name
mod 'CiscoSystems/rsync', :git => "#{base_url}/CiscoSystems/puppet-rsync", :ref => branch_name
mod 'CiscoSystems/sysctl', :git => "#{base_url}/CiscoSystems/puppet-sysctl", :ref => branch_name
mod 'CiscoSystems/vswitch', :git => "#{base_url}/CiscoSystems/puppet-vswitch", :ref => branch_name
mod 'CiscoSystems/xinetd', :git => "#{base_url}/CiscoSystems/puppet-xinetd", :ref => branch_name
mod 'CiscoSystems/network', :git => "#{base_url}/CiscoSystems/puppet-network", :ref => branch_name
mod 'CiscoSystems/filemapper', :git => "#{base_url}/CiscoSystems/puppet-filemapper", :ref => branch_name
mod 'CiscoSystems/boolean', :git => "#{base_url}/CiscoSystems/puppet-boolean", :ref => branch_name
#mod 'CiscoSystems/ssh', :git => "#{base_url}/CiscoSystems/puppet-ssh", :ref => branch_name

# puppet utilities
mod 'CiscoSystems/concat', :git => "#{base_url}/CiscoSystems/puppet-concat", :ref => branch_name
# need the latest changes here
mod 'CiscoSystems/inifile', :git => "#{base_url}/CiscoSystems/puppet-inifile", :ref => branch_name
mod 'CiscoSystems/stdlib', :git => "#{base_url}/CiscoSystems/puppet-stdlib", :ref => branch_name
