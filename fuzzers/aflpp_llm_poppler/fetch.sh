#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

git clone https://github.com/SecurityLab-UCD/AFLplusplus.git "$FUZZER/repo"
git -c advice.detachedHead=false -C "$FUZZER/repo"  checkout e9af2bbc5aab5374a029fe19c67ceddb671a1c37
# ab0cc97da77a90f82cea84f52ccc5130057f3879

git clone https://github.com/SecurityLab-UCD/structureLLM.git "$FUZZER/repo/structureLLM"
git -c advice.detachedHead=false -C "$FUZZER/repo/structureLLM" checkout 99989f4b80298b829d680295e7d1f007ed416caa