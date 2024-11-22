#include <gtest/gtest.h>
#include "../src/math_operations.h"

TEST(MathOperationsTest, Add) {
    EXPECT_EQ(add(2, 3), 5);
}

TEST(MathOperationsTest, Subtract) {
    EXPECT_EQ(subtract(5, 3), 2);
}

TEST(MathOperationsTest, Multiply) {
    EXPECT_EQ(multiply(4, 5), 20);
}

TEST(MathOperationsTest, Divide) {
    EXPECT_EQ(divide(10, 2), 5);
}

TEST(MathOperationsTest, DivideByZero) {
    EXPECT_THROW(divide(10, 0), std::invalid_argument);
}
