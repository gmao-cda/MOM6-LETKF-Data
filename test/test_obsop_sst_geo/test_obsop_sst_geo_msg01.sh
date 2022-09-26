#!/bin/bash

dir_executables=$1
model=$2
x_test="${dir_executables}/OCN.obsOp_${model}.sst_geostationary.x"
echo "x_test=$x_test"

#
# test L2 MSG04
#
$x_test -gues prog.nc -obsin 20220101000000-OSPO-L2P_GHRSST-SSTskin-MSG01-v02.0-fv01.0.nc
stat=$?

if [ $stat -ne "0" ]; then
   echo "L2 MSG01 SST test failed"
   exit 1
fi
rm -f *.dat

echo "Test passed"
exit 0

