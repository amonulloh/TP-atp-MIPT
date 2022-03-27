#include <gtest/gtest.h>
#include "A/index.h"
#include "B/lib.cpp"

TEST(INDEX, test) {
    EXPECT_EQ(a, 12);
    EXPECT_EQ(b, 7);
    EXPECT_EQ(res, 27);
}

TEST(LIB, testing) {
    EXPECT_EQ(sum(14, 15), 29);
}

