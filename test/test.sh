#
# Copyright (c) 2017 ChienYu Lin
#
# Author: ChienYu Lin <cy20lin@gmail.com>
#
SHIM_TEST_OLD_PWD="${PWD}"
cd "$(dirname "$0")/../lib/shim"
. "./shim.sh"
cd "../../test"
. "./unittest.sh"
. "./test_unittest.sh"
. "./test_shim.sh"
. "./test_shim_core.sh"
. "./test_shim_object.sh"
. "./test_shim_coll_deque.sh"
. "./test_shim_coll_vector.sh"
. "./test_shim_coll_map.sh"
cd "${SHIM_TEST_OLD_PWD}"
CONCLUDE
