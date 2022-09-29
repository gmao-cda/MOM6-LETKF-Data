#!/bin/bash

dir_executables=$1
model=$2
x_test="${dir_executables}/OCN.obsOp_${model}.sst.x"
echo "x_test=$x_test"

#
# test L2 AVHRR
#
$x_test -gues prog.nc -obsin 20120101022144-NODC-L3C_GHRSST-SSTskin-AVHRR_Pathfinder-PFV5.2_NOAA19_G_2012001_night-v02.0-fv01.0.nc
stat=$?

if [ $stat -ne "0" ]; then
   echo "L2 AVHRR SST test failed"
   exit 1
fi
rm -f *.dat

echo "Test passed"
exit 0

