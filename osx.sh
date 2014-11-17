#! /bin/bash

set -e

mkdir -p ~/bin

[ -e ~/bin/airport ] || ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport ~/bin/airport 

xcode-select --install
