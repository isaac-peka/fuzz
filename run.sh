#!/bin/bash

afl-fuzz -i in/packs -o out/ -- git/git unpack-objects --strict 

