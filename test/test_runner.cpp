/*
 * test_runner.cpp
 *
 *  Created on: Sep 9, 2017
 *      Author: eclipse1
 */

#include <gtest/gtest.h>
#include <gmock/gmock.h>

// include the test framework source code from the git submodule
// directly into this compilation unit.
#include <src/gtest-all.cc>
#include <src/gmock-all.cc>

int main(int argc, char ** argv) {
    testing::InitGoogleMock(&argc, argv);
    return RUN_ALL_TESTS();
}
