#include <iostream>
#include <gtest/gtest.h>

int sum(int a, int b) {
	return a+b;
}

TEST(sum, testSum) {
	EXPECT_EQ(5, sum(2, 3));
	EXPECT_NE(3, sum(3, 4));
	EXPECT_LT(3, sum(3, 4));
	EXPECT_LE(7, sum(3, 4));
	EXPECT_GE(7, sum(3, 4));
	EXPECT_GT(8, sum(3, 4));
    const char* pStr = "src/1234";
    EXPECT_EQ(strrchr(pStr, '/'), pStr+3);
}

int main(int argc, char **argv)
{
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
