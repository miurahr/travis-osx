#!/bin/sh

set -e

export PATH=/usr/local/bin:$PATH

#brew update
brew uninstall postgis gdal
brew install ccache swig
#brew outdated cmake || brew upgrade cmake
#sudo xcode-select --reset
brew list --versions

