#!/bin/bash

cd git
CC=afl-cc CXX=acl-c++ make -j$(nproc)
cd ../

unzip packfiles.zip -d ./in
