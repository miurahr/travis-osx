#!/bin/sh

set -e

export PATH=/usr/local/bin:$PATH

mkdir good-case
cd good-case
echo run cmake -DCMAKE_INSTALL_PREFIX=\$HOME/install-zlib ../
cmake -DCMAKE_INSTALL_PREFIX=$HOME/install-zlib ../
