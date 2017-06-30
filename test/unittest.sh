#
# Copyright (c) 2017 ChienYu Lin
#
# Author: ChienYu Lin <cy20lin@gmail.com>
#

END_TESTCASE(){
    true
    # echo end testcase .. "${@}"
    # echo
}

___() {
    "${@}"
    return $?
}

TESTCASE() {
    echo testcase .. "${@}"

}

SECTION() {
    echo ' 'section .. "${@}"
}

END_SECTION(){
    true
}

ASSERT() {
    prefix="  assert"
    status="failed"
    reason=
    asserts=
    command_notfound=0
    type "${1}" 1>/dev/null 2>/dev/null || command_notfound=1
    if test $command_notfound -eq 1
    then
        status="failed (command not found)"
        SHIM_TEST_assert_command_not_found_count=$(expr $SHIM_TEST_assert_command_not_found_count + 1)
        SHIM_TEST_assert_failed_count=$(expr $SHIM_TEST_assert_failed_count + 1)
    elif "$@" 2>/dev/null 1>/dev/null
    then
        result=$?
        status="passed"
    else
        result=$?
    fi
    echo "${prefix} ${status} ${reason} .. ${@}"
    if test "$result" -eq 0
    then
        SHIM_TEST_assert_passed_count=$(expr $SHIM_TEST_assert_passed_count + 1)
    else
        SHIM_TEST_assert_failed_count=$(expr $SHIM_TEST_assert_failed_count + 1)
    fi
    return $result

}

NOT() {
    type "${1}" 1>/dev/null 2>/dev/null || command_notfound=1
    if "${@}"
    then
        return 1
    else
        return 0
    fi
}

CONCLUDE() {
    SHIM_TEST_assert_count=$(expr $SHIM_TEST_assert_passed_count + $SHIM_TEST_assert_failed_count)
    echo
    printf "%s asserts, %s passed, %s failed (%s command not found).\n" \
        $SHIM_TEST_assert_count \
        $SHIM_TEST_assert_passed_count \
        $SHIM_TEST_assert_failed_count \
        $SHIM_TEST_assert_command_not_found_count
    test $SHIM_TEST_assert_failed_count -eq 0
}

SHIM_TEST_assert_passed_count=0
SHIM_TEST_assert_failed_count=0
SHIM_TEST_assert_command_not_found_count=0
