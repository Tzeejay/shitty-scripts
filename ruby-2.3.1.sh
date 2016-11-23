#!/usr/bin/env bash

mkdir -p /src/openssl
mkdir -p /src/ruby
mkdir -p /src/chruby
mkdir -p /opt/rubies/rubgems-update

mkdir -p /opt/openssl
mkdir -p /opt/rubies

curl -s https://www.openssl.org/source/openssl-1.0.2j.tar.gz | tar -C /src/openssl/ -xzf - && \
    cd /src/openssl/openssl-1.0.2j && \
    ./Configure \
      --openssldir=/opt/openssl/openssl-1.0.2 \
      shared no-ssl2 darwin64-x86_64-cc && \
    make && make install_sw


curl -s https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz | tar -C /src/ruby -xzf - && \
    cd /src/ruby/ruby-2.3.1 && \
    autoconf && ./configure \
      --with-openssl-dir=/opt/openssl/openssl-1.0.2 \
      --prefix=/opt/rubies/ruby-2.3.1 \
      --disable-install-doc && \
    make && make install
  

curl -s https://curl.haxx.se/ca/cacert.pem > /opt/openssl/openssl-1.0.2/certs/cert.pem

echo "export SSL_CERT_FILE=/opt/openssl/openssl-1.0.2/certs/cert.pem" > /Users/cj/.bash_profile

curl -s https://rubygems.org/downloads/rubygems-update-2.6.7.gem > /opt/rubies/rubygems-update/rubygems-update-2.6.7.gem

sudo gem install --local /opt/rubies/rubygems-update/rubygems-update-2.6.7.gem

update_rubygems --no-ri --no-rdoc

gem uninstall rubygems-update -x
