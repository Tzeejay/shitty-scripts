#!/usr/bin/env bash
mkdir -p /src/autoconf

curl -s http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz | tar -C /src/autoconf/ -xzf - && \
    cd /src/autoconf/autoconf-2.69 && \
    sh ./configure && \
    make install
    
 
rm -rf /src/autoconf
   
    