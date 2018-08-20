#!/bin/sh

set -e

export PATH=/usr/local/bin:$PATH

mkdir cmake-build-osx-debug
cd cmake-build-osx-debug
cmake \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache \
  ../
