#!/bin/bash

cd git
make configure
CC=$(which afl-cc) CXX=$(which afl-c++) ./configure --disable-shared
make all

cd ../
unzip packfiles.zip -d in/
