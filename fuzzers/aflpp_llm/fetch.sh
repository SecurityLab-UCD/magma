#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

git clone https://github.com/SecurityLab-UCD/AFLplusplus.git "$FUZZER/repo"
git -c advice.detachedHead=false -C "$FUZZER/repo"  checkout 10418861ba7d15152b5261d885bd57ed27d0c729

git clone https://github.com/SecurityLab-UCD/structureLLM.git "$FUZZER/repo/structureLLM"
git -c advice.detachedHead=false -C "$FUZZER/repo/structureLLM" checkout 98e2908a61494e6ddec4fb8c8013fea43bea3d33