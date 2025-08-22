#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
echo Assembling mos3
/Library/Developer/CommandLineTools/usr/bin/clang -x assembler -c -target arm64-apple-macosx11.0.0 -o /Users/c/Developer/miamp/lib/aarch64-darwin/mos3.o  -x assembler /Users/c/Developer/miamp/lib/aarch64-darwin/mos3.s
if [ $? != 0 ]; then DoExitAsm mos3; fi
rm /Users/c/Developer/miamp/lib/aarch64-darwin/mos3.s
echo Assembling miamp
/Library/Developer/CommandLineTools/usr/bin/clang -x assembler -c -target arm64-apple-macosx11.0.0 -o /Users/c/Developer/miamp/lib/aarch64-darwin/miamp.o  -x assembler /Users/c/Developer/miamp/lib/aarch64-darwin/miamp.s
if [ $? != 0 ]; then DoExitAsm miamp; fi
rm /Users/c/Developer/miamp/lib/aarch64-darwin/miamp.s
echo Linking /Users/c/Developer/miamp/miamp
OFS=$IFS
IFS="
"
/Library/Developer/CommandLineTools/usr/bin/ld     -framework Cocoa      -order_file /Users/c/Developer/miamp/symbol_order.fpc -multiply_defined suppress -L. -o /Users/c/Developer/miamp/miamp `cat /Users/c/Developer/miamp/link16219.res` -filelist /Users/c/Developer/miamp/linkfiles16219.res
if [ $? != 0 ]; then DoExitLink /Users/c/Developer/miamp/miamp; fi
IFS=$OFS
