#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

git clone https://github.com/SecurityLab-UCD/AFLplusplus.git "$FUZZER/repo"
git -c advice.detachedHead=false -C "$FUZZER/repo"  checkout a8d85a52c95b2dabe329fcf7cebee93824a5feb3

git clone https://github.com/SecurityLab-UCD/structureLLM.git "$FUZZER/repo/structureLLM"
git -c advice.detachedHead=false -C "$FUZZER/repo/structureLLM" checkout 4b0579b4e2875c28b26b4643c9db64d648e9236f