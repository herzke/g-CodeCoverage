// The test framework
#include <gtest/gtest.h>

// The header for the code under test
#include "../src/factorial.hh"

// The first test
TEST(factorial, factorial_of_0_is_1) {
  EXPECT_EQ(1U, factorial(0U));
}
