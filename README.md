## Test data for MOM6-LETKF
Creator: Cheng Da (cda@umd.edu)

Note github lfs is not used.


```
mkdir build && cd build && cmake .. -DMODEL=mom6 -DOBSOP_DIR=/data2/cda/work/Ocean-LETKF_cd10kfsu/cmake_build/src -DTEST_OBSOP=ON && ctest --output-on-failure
```
