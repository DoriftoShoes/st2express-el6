service iptables stop
setenforce permissive

rm -rf /var/cache/yum/yumdb/* && rm -f /var/lib/rpm/__db* && rm -Rf /var/cache/yum/x86_64/6Server/* && rpm --rebuilddb && yum clean dbcache && yum clean all

cp /vagrant/st2_el6.repo /etc/yum.repos.d/
rpm -Uvh http://rbel.frameos.org/rbel6
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum clean all
yum clean dbcache
yum install -y glibc glibc-headers glibc-devel nscd
yum install -y nc git rubygems
yum groupinstall -y "Development tools"
yum install -y puppet
puppet module install maestrodev-wget
puppet module install stankevich-python
puppet module install puppetlabs-inifile
puppet module install puppetlabs-mysql
puppet module install puppetlabs-vcsrepo
puppet module install puppetlabs-rabbitmq
puppet module install puppetlabs-mongodb
puppet module install puppetlabs-nodejs

yum install -y St2Puppet
