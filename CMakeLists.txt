cmake_minimum_required(VERSION 3.8)
project(clion_CodeCoverage)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES src/run_tests.cpp)
add_executable(run_tests ${SOURCE_FILES})
