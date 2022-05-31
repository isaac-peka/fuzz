#!/bin/bash

export AFL_USE_ASAN=1
export AFL_LLVM_LAF_ALL=1
export PATH="/usr/lib/llvm-12/bin:$PATH"

cd ruby
autoconf
mkdir build
cd build
AR=llvm-ar RANLIB=llvm-randlib CC=afl-lto CXX=afl-lto++ LD=afl-ld-lto ../configure
make miniruby