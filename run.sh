#!/bin/bash

export AFL_IMPORT_FIRST=1

ROOT="$PWD"

I="$ROOT/in/packs/"
O="$ROOT/out/"
C="$[$(grep -c ^processor /proc/cpuinfo)-1]"

echo "Launching main"
tmux new-window -n main "afl-fuzz -i $I -o $O -M main -- git/git unpack-objects --strict"

opts=(
    "-L 0"
    "-L 0 -p explore"
    "-L 0 -p coe"
    "-p quad"
    "-p fast"
    "-p exploit"
    "-p rare"
    "-Z"
)

for i in $(seq 1 $C); do 
    cd $(mktemp -d) 

    git init > example.txt
    git add .
    git commit -m "First commit" > /dev/null

    echo "Launching instance $i at $PWD"
    tmux new-window "afl-fuzz -i $I -o $O -S s$i ${opts[i%8+1]} -- $ROOT/git/git unpack-objects --strict"
done

echo "Done!"
cd $ROOT
