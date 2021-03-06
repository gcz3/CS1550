#!/bin/bash
# Fast boot script for rebuilding Linux kernel
# (C) Mohammad H. Mofrad, 2016

if [ $# -ne 1 ]; then
    echo Usage: ./test.sh PITT_ID
    exit 1
fi

# Change the directory based on your working directory on thoth
scp $1@thoth.cs.pitt.edu:/u/OSLab/$1/project2/demo/\{bzImage,System.map,prodcons\} ./
# Copy kernel files
/bin/cp -rf bzImage /boot/bzImage-devel
/bin/cp -rf System.map /boot/System.map-devel
# Boot from modified kernel
lilo
