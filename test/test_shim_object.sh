#
# Copyright (c) 2017 ChienYu Lin
#
# Author: ChienYu Lin <cy20lin@gmail.com>
#

TESTCASE "testing shim_object"
ASSERT NOT shim_object_typeof
ASSERT NOT shim_object_typeid
ASSERT NOT shim_object_new
ASSERT NOT shim_object_delete
ASSERT NOT shim_object_print
END_TESTCASE
