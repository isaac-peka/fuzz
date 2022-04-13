#!/bin/bash

export AFL_USE_ASAN=1
export PATH="/usr/lib/llvm-12/bin:$PATH"

cd git
make configure
AR=llvm-ar RANLIB=llvm-randlib CC=afl-lto CXX=afl-lto++ ./configure --enable-lto --disable-shared --disable-inline-asm
make all

cd ../
unzip packfiles.zip -d in/
