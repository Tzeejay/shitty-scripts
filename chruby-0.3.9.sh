#!/usr/bin/env bash

mkdir -p /src/chruby

curl -s -L https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz | tar -C /src/chruby -xzvf - && \
    cd /src/chruby/chruby-0.3.9 && \
    make install


