#!/bin/sh

set -e

export PATH=/usr/local/bin:$PATH

mkdir bad-case
cd bad-case
cmake \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache \
  -DPREFIX=$HOME/install-zlib \
  ../
