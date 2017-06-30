
TESTCASE "unittest utility self testing"
ASSERT true
ASSERT true
ASSERT test 1 -eq 1
ASSERT test 2 -eq 2
ASSERT test ! 2 -eq 1
ASSERT NOT false
ASSERT NOT NOT true
ASSERT NOT NOT NOT false
ASSERT NOT test 1 -eq 2
END_TESTCASE
