cmake_minimum_required(VERSION 3.18)
project(MOM6-LETKF-Data LANGUAGES Fortran)

option(TEST_OBSOP "run test for obsop" OFF)
option(TEST_LETKF "run test for letkf" OFF)
set (MODEL "mom6")

set (DEFAULT_OBSOP_DIR "./")
if (NOT OBSOP_DIR)
    set (OBSOP_DIR ${DEFAULT_OBSOP_DIR})
endif()


enable_testing()


if (TEST_OBSOP)
    # obsop_sst_geostaionary::MSG01
    set(test_name test_obsop_sst_geo_msg01)
    add_test(
            NAME ${test_name}
            COMMAND ./${test_name}.sh ${OBSOP_DIR} ${MODEL}
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/test/test_obsop_sst_geo)
    set_tests_properties(${test_name}
            PROPERTIES PASS_REGULAR_EXPRESSION "Test passed")

    # obsop_sss_geostationary:: GOES-16 ABI
    set(test_name test_obsop_sst_geo_g16_abi)
    add_test(
            NAME ${test_name}
            COMMAND ./${test_name}.sh ${OBSOP_DIR} ${MODEL}
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/test/test_obsop_sst_geo)
    set_tests_properties(${test_name}
            PROPERTIES PASS_REGULAR_EXPRESSION "Test passed")


#    # obsop_sss::L2 SMAP SSS
#    set(test_name test_obsop_sss_l2)
#    add_test(
#            NAME ${test_name}
#            COMMAND ./${test_name}.sh ${OBSOP_DIR} ${MODEL}
#            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/test/test_obsop_sss)
#    set_tests_properties(${test_name}
#            PROPERTIES PASS_REGULAR_EXPRESSION "Test passed")
# 
#
#    # obsop_sss::L3 SMAP SSS
#    set(test_name test_obsop_sss_l3)
#    add_test(
#            NAME ${test_name}
#            COMMAND ./${test_name}.sh ${OBSOP_DIR} ${MODEL}
#            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/test/test_obsop_sss)
#    set_tests_properties(${test_name}
#            PROPERTIES PASS_REGULAR_EXPRESSION "Test passed")


endif()
