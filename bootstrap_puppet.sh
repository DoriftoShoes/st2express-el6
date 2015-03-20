service iptables stop
setenforce permissive

if [ -f /etc/yum.repos.d/cel-6.50-6Server-server.repo ];
then
    rm /etc/yum.repos.d/cel-6.50-6Server-server.repo
    echo "Removed"
else
    echo "Nothing to remove."
fi

if [ -f /etc/yum.repos.d/cisco-epel.repo ];
then
    rm /etc/yum.repos.d/cisco-epel.repo
    echo "Removed"
else
    echo "Nothing to remove."
fi

if [ -f /etc/yum.repos.d/rtp-linux.repo ];
then
    rm /etc/yum.repos.d/rtp-linux.repo
    echo "Removed"
else
    echo "Nothing to remove."
fi

rm -rf /var/cache/yum/yumdb/* && rm -f /var/lib/rpm/__db* && rm -Rf /var/cache/yum/x86_64/6Server/* && rpm --rebuilddb && yum clean dbcache && yum clean all

cp /vagrant/st2_el6.repo /etc/yum.repos.d/
rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh http://rbel.frameos.org/rbel6
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum clean all
yum clean dbcache
yum install -y glibc glibc-headers glibc-devel nscd
yum install -y --skip-broken nc git rubygems
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
