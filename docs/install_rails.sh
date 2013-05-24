#!/bin/bash
if [ $# -ne 1 ]; then
	echo -e "Using $0 package_manager"
	exit 1
fi
package_manager=$1
if [ $package_manager == "yum" ]; then
	$package_manager clean all && $package_manager update -n
	$package_manager install perl-ExtUtils-MakeMaker gettext gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel cmake ruby-mysql mysql-devel libxml2 libxslt libxml2-devel libxslt-devel  -y
else 
	$package_manager install perl-ExtUtils-MakeMaker gettext gcc-c++ patch readline readline-dev zlib zlib-devel libyaml-dev libffi-dev openssl-dev make bzip2 autoconf automake libtool bison iconv-dev cmake libmysql-ruby libmysqlclient-dev libxml2 libxslt -y
fi
echo -e "Installing git"
wget http://git-core.googlecode.com/files/git-1.7.7.4.tar.gz --directory-prefix=/tmp/
cd /tmp/ && tar zxf git-1.7.7.4.tar.gz
cd /tmp/git-1.7.7.4/ && ./configure && make && make install
rm -rf /tmp/git-1.7.7.4*

echo -e "Installing curl"
wget http://curl.haxx.se/download/curl-7.23.1.tar.gz --directory-prefix=/tmp/
cd /tmp/ && tar zxf curl-7.23.1.tar.gz
cd curl-7.23.1 && ./configure && make && make install
rm -rf /tmp/curl*

echo -e "Installing RVM"
bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bashrc

source ~/.bashrc

echo -e "Installing rails"
rvm install 1.9.2
rvm --create use 1.9.2@rails3tutorial
rvm --default use 1.9.2@rails3tutorial
gem install rails


svn checkout http://newcs.googlecode.com/svn/trunk/trunk/NewCS/ ~/newcs
#or download from git repo:
#git checkout https://github.com/snooppy/newcs.git ~/newcs
cd ~/newcs/ && bundle install

