#!/bin/bash

dir_executables=$1
model=$2
x_test="${dir_executables}/OCN.obsOp_${model}.sst_geostationary.x"
echo "x_test=$x_test"

#
# test L2 GOES-16 ABI SST
#
$x_test -gues prog.nc -obsin 20220110000000-STAR-L2P_GHRSST-SSTsubskin-ABI_G16-ACSPO_V2.70-v02.0-fv01.0.nc -navin G16_075_0_W.nc
stat=$?

if [ $stat -ne "0" ]; then
   echo "L2 GOES-16 ABI SST test failed"
   exit 1
fi
rm -f *.dat

echo "Test passed"
exit 0

