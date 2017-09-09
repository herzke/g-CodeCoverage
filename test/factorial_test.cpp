#include <gtest/gtest.h>
#include "../src/factorial.hh"

TEST(Canary, CanaryTest) {
    EXPECT_EQ(0, 1-1);
}

TEST(Factorial, factorial_of_0_returns_1) {
    EXPECT_EQ(1U, factorial(0));
}
