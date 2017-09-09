cmake_minimum_required(VERSION 3.8)
project(clion_CodeCoverage)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES main.cpp)
add_executable(clion_CodeCoverage ${SOURCE_FILES})