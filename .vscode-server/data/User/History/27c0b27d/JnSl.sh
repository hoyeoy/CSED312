#!/bin/bash

# Step 1: Add environment variables to ~/.bashrc
echo 'export PINTOSPATH="/home/user/pintos"' >> ~/.bashrc
echo 'export PATH=$PINTOSPATH/src/utils:$PATH' >> ~/.bashrc

export PINTOSPATH="/home/user/pintos"
export PATH=$PINTOSPATH/src/utils:$PATH

# Step 2: Replace line 7 of pintos/src/threads/Make.vars
sed -i '7s/SIMULATOR = --bochs/SIMULATOR = --qemu/' "$PINTOSPATH/src/threads/Make.vars"

# Step 3: Replace line 5 of pintos/src/utils/Makefile
sed -i '5s/LOADLIBES = -lm/LDLIBS = -lm/' "$PINTOSPATH/src/utils/Makefile"

# Step 4: Replace line 104 of pintos/src/utils/pintos
sed -i '104s/\$sim = "bochs" if !defined \$sim;/\$sim = "qemu" if !defined \$sim;/' "$PINTOSPATH/src/utils/pintos"

# Step 5: Replace line 4 of pintos/src/utils/pintos-gdb
sed -i '4s|GDBMACROS=/usr/class/cs140/pintos/pintos/src/misc/gdb-macros|GDBMACROS=$PINTOSPATH/src/misc/gdb-macros|' "$PINTOSPATH/src/utils/pintos-gdb"

# Reload shell configuration
source ~/.bashrc

echo "All steps have been completed successfully."
