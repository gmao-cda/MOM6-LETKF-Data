#!/bin/bash

dir_executables=$1
model=$2
x_test="${dir_executables}/OCN.obsOp_${model}.sss.x"
echo "x_test=$x_test"

#
# test L3 SMAP SSS
#
$x_test -gues prog.nc -obsin SMAP_L3_SSS_20220105_8DAYS_V5.0.nc -olevel 3
stat=$?

if [ $stat -ne "0" ]; then
   echo "L3 SMAP SSS test failed"
   exit 1
fi
rm -f *.dat


echo "Test passed"
exit 0

