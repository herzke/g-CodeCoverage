cmake_minimum_required(VERSION 3.8)
project(clion_CodeCoverage)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_VERBOSE_MAKEFILE ON)

set(SOURCE_FILES test/factorial_test.cpp src/factorial.cpp src/factorial.hh)
add_executable(run_tests ${SOURCE_FILES})

add_subdirectory(googletest-github)
include_directories(googletest-github/googletest/include)
include_directories(googletest-github/googlemock/include)
target_link_libraries(run_tests gmock_main)
