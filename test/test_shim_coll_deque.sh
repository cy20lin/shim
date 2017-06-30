#
# Copyright (c) 2017 ChienYu Lin
#
# Author: ChienYu Lin <cy20lin@gmail.com>
#

TESTCASE "testing shim_coll_deque"
ASSERT shim_coll_deque_init deque
ASSERT shim_coll_deque_deinit deque

END_TESTCASE
