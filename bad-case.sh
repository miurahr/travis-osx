#!/bin/sh

set -e

export PATH=/usr/local/bin:$PATH

mkdir bad-case
cd bad-case
echo run cmake -DPREFIX=\$HOME/install-zlib ../
cmake -DPREFIX=$HOME/install-zlib  ../
