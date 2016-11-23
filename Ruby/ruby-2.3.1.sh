#!/usr/bin/env bash

# 
# Making a few temporary directories
mkdir -p /src/openssl
mkdir -p /src/ruby
mkdir -p /opt/rubies/rubgems-update

mkdir -p /opt/openssl
mkdir -p /opt/rubies

#
# Downloading Openssl-1.0.2j 
# Configuring Openssl to live in /opt/openssl
# Configuring it as shared so that the header files are available to Ruby
# Configuring it with no-ssl2 because it's utterly broken
# Configuring the system to be darwin64-x86_64-cc so that the correct compiler will be used
# make & make install_sw will install Openssl onto the system
curl -s https://www.openssl.org/source/openssl-1.0.2j.tar.gz | tar -C /src/openssl/ -xzf - && \
    cd /src/openssl/openssl-1.0.2j && \
    ./Configure \
      --openssldir=/opt/openssl/openssl-1.0.2 \
      shared no-ssl2 darwin64-x86_64-cc && \
    make && make install_sw

#
# Downloading Ruby 2.3.1
# Configuring Ruby to use the Openssl version we just installed
# Configuring Ruby to be installed into /opt/rubies in order to be picked up by chruby
# Configuring Ruby to not install any docs
# make & make install installs Ruby onto the system
curl -s https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz | tar -C /src/ruby -xzf - && \
    cd /src/ruby/ruby-2.3.1 && \
    autoconf && ./configure \
      --with-openssl-dir=/opt/openssl/openssl-1.0.2 \
      --prefix=/opt/rubies/ruby-2.3.1 \
      --disable-install-doc && \
    make && make install
  
#
# Download Rubygems update via curl because of missing certificates shipping with Ruby 2.3.1
curl -s https://rubygems.org/downloads/rubygems-update-2.6.7.gem > /opt/rubies/rubygems-update/rubygems-update-2.6.7.gem

#
# Installing the update as a local gem
gem install --local /opt/rubies/rubygems-update/rubygems-update-2.6.7.gem
update_rubygems --no-ri --no-rdoc

#
# Uninstalling the rubygems-update from disk and removing the temporary directory
gem uninstall rubygems-update -x
rm -rf /opt/rubygems-update
