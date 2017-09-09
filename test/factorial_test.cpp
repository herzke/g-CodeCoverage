/*
 * factorial_test.cpp
 *
 *  Created on: Sep 9, 2017
 *      Author: eclipse1
 */

#include <gtest/gtest.h>
#include "factorial.h"

TEST(factorial, factorial_of_0_is_1) {
	EXPECT_EQ(1U, factorial(0U));
}


