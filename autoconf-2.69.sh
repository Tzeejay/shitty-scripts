#!/usr/bin/env bash
mkdir -p /src/autoconf

curl -s http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz | tar -C /src/autoconf/ -xzf - && \
    cd /src/autoconf/autoconf-2.69 && \
    sh configure --prefix /opt/autoconf && \
    make install
    
for file in autoconf autoheader autom4te autoreconf autoscan autoupdate ifnames
 do
  echo "Moving $file into /usr/local/bin"
  mv /opt/autoconf/bin/$file /usr/local/bin/$file
 done
 
 rm -rf /src/autoconf
 rm -rf /opt/autoconf   
    