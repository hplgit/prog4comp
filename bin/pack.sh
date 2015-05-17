#!/bin/sh
# Pack tar files for the code examples
#
# stand in root of this repo
# sh -x bib/pack.sh
#
set -x
tar czf prog4comp-python.tar.gz src/py
tar czf prog4comp-matlab.tar.gz src/m
mv -f prog4comp-*.tar.gz src
