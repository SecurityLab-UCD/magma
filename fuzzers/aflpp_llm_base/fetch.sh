#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

git clone https://github.com/SecurityLab-UCD/AFLplusplus.git "$FUZZER/repo"
git -c advice.detachedHead=false -C "$FUZZER/repo"  checkout 6be80c64718875174d124c4ce7ff2752c55caeb8