#!/usr/bin/env bash

mkdir -p /src/chruby

curl -s -L https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz | tar -C /src/chruby -xzvf - && \
    cd /src/chruby/chruby-0.3.9 && \
    make install


echo "Please add this to your ~/.bashrc or ~/.profile \"source /usr/local/share/chruby/chruby.sh\" and \"source /usr/local/share/chruby/auto.sh\" if you want chruby to detect .ruby-version files"