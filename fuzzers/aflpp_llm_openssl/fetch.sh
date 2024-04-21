#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

git clone https://github.com/SecurityLab-UCD/AFLplusplus.git "$FUZZER/repo"
git -c advice.detachedHead=false -C "$FUZZER/repo"  checkout 0a53b3ff8f2f977af98a00c212524f9362a24653

git clone https://github.com/SecurityLab-UCD/structureLLM.git "$FUZZER/repo/structureLLM"
git -c advice.detachedHead=false -C "$FUZZER/repo/structureLLM" checkout 99989f4b80298b829d680295e7d1f007ed416caa