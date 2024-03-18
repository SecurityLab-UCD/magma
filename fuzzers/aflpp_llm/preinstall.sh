#!/bin/bash
set -e

apt-get update && \
    apt-get install -y make clang-9 llvm-9-dev libc++-9-dev libc++abi-9-dev \
        build-essential git wget gcc-7-plugin-dev liblzma-dev bzip2
# set timezone
ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone
apt update && apt upgrade -y # Install python3.10 reliance
apt install -y wget build-essential libreadline-gplv2-dev libncursesw5-dev \
     libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz 
tar xzf Python-3.10.0.tgz
cd Python-3.10.0 
./configure --enable-optimizations
# make -j $(nproc)
make altinstall
apt install -y software-properties-common
wget https://bootstrap.pypa.io/get-pip.py
python3.10 get-pip.py

pip3.10 install torch>=2.0.1 torchvision>=0.15.2 torchaudio>=2.0.2 --index-url https://download.pytorch.org/whl/nightly/cu118
pip3.10 install datasets>=2.14.5
pip3.10 install tqdm==4.65.0
pip3.10 install peft==0.6.2
pip3.10 install accelerate==0.24.1
pip3.10 install transformers==4.35.0
pip3.10 install trl==0.7.2
pip3.10 install tyro
pip3.10 install typing
pip3.10 install sysv-ipc
pip3.10 install bitsandbytes

wget https://raw.githubusercontent.com/TimDettmers/bitsandbytes/main/install_cuda.sh
bash install_cuda.sh 118 /usr/local

update-alternatives \
  --install /usr/lib/llvm              llvm             /usr/lib/llvm-9  20 \
  --slave   /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-9  \
    --slave   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-9 \
    --slave   /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-9 \
    --slave   /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-9 \
    --slave   /usr/bin/llvm-c-test       llvm-c-test      /usr/bin/llvm-c-test-9 \
    --slave   /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-9 \
    --slave   /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-9 \
    --slave   /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-9 \
    --slave   /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-9 \
    --slave   /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-9 \
    --slave   /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-9 \
    --slave   /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-9 \
    --slave   /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-9 \
    --slave   /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-9 \
    --slave   /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-9 \
    --slave   /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-9 \
    --slave   /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-9 \
    --slave   /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-9 \
    --slave   /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-9 \
    --slave   /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-9 \
    --slave   /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-9

update-alternatives \
  --install /usr/bin/clang                 clang                  /usr/bin/clang-9     20 \
  --slave   /usr/bin/clang++               clang++                /usr/bin/clang++-9 \
  --slave   /usr/bin/clang-cpp             clang-cpp              /usr/bin/clang-cpp-9