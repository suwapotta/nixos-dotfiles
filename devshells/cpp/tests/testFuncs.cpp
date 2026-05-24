#include "../src/funcs.h"
#include <gtest/gtest.h>

TEST(addTest, basicAdd) {
  int result = add(1, 2);
  EXPECT_EQ(result, 3);
}

TEST(addTest, negativeNumbers) {
  int result = add(-1, -5);
  EXPECT_EQ(result, -6);
}
