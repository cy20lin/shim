#
# Copyright (c) 2017 ChienYu Lin
#
# Author: ChienYu Lin <cy20lin@gmail.com>
#

TESTCASE "testing shim_core"

SECTION "testing shim_core_set"
ASSERT shim_core_set a 1
ASSERT test ${a} -eq 1
ASSERT shim_core_set a "with space and special character{!@#$%^&*()_+|}"
ASSERT test ${a} -eq "with space and special character{!@#$%^&*()_+|}"
END_SECTION

SECTION "testing shim_core_get"
x=1
ASSERT shim_core_get x a
ASSERT test "${x}" -eq "${a}"
x=2
ASSERT NOT test "${x}" -eq "${a}"
x="with space and special character{!@#$%^&*()_+|}"
ASSERT shim_core_get x a
ASSERT echo test "${x}" = "${a}"
END_SECTION

END_TESTCASE
