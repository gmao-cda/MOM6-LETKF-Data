#!/bin/bash

dir_executables=$1
model=$2
x_test="${dir_executables}/OCN.obsOp_${model}.sss.x"
echo "x_test=$x_test"

#
# test L2 SMAP SSS
#
$x_test -gues prog.nc -obsin SMAP_L2B_SSS_36950_20220101T005200_R18240_V5.0.h5 -olevel 2
stat=$?

if [ $stat -ne "0" ]; then
   echo "L2 SMAP SSS test failed"
   exit 1
fi
rm -f *.dat

echo "Test passed"
exit 0

