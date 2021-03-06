#!/bin/bash

# AFL++ Dependencies

sudo apt-get install -y build-essential python3-dev automake cmake git \ 
    flex bison libglib2.0-dev libpixman-1-dev python3-setuptools \
    clang-12 clang-tools-12 libc++1-12 libc++-12-dev \
    libc++abi1-12 libc++abi-12-dev libclang1-12 libclang-12-dev \
    libclang-common-12-dev libclang-cpp12 libclang-cpp12-dev liblld-12 \
    liblld-12-dev liblldb-12 liblldb-12-dev libllvm12 libomp-12-dev \
    libomp5-12 lld-12 lldb-12 llvm-12 llvm-12-dev llvm-12-runtime llvm-12-tools \
    ninja-build gcc-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-plugin-dev \
    libstdc++-$(gcc --version|head -n1|sed 's/\..*//'|sed 's/.* //')-dev

sudo apt-get install -f -y

echo '
Remember to add when building AFLPlusPlus:

export LLVM_BIN=/usr/lib/llvm-12/bin
export PATH="$LLVM_BIN:$PATH"
export LLVM_CONFIG="$LLVM_BIN/llvm-config"
export LD_LIBRARY_PATH="$($LLVM_CONFIG --libdir)${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
'
