#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export UNDER_TEST=0
    export TEST_MOCK_ARGV=('scripts/test')

    . scripts/test
}

@test "scripts/test run_test_file success test" {
    run run_test_file tests/lib.sh.bats

    assert_success
    last_line="${#lines[@]}"
    ((last_line--))
    assert_line -n 0 'scripts/test … running tests/lib.sh.bats:'
    assert_line -n "$last_line" 'scripts/test 🗹 tests/lib.sh.bats done'
}

@test "scripts/test run_test_file non-existent file test" {
    run run_test_file nonsense

    assert_failure
    assert_output 'scripts/test ✗ Could not run test file nonsense'
}

@test "scripts/test run_test_file failing test file test" {
    function bats() {
        echo 'Error!'
        return 1
    }
    export -f bats

    run run_test_file tests/lib.sh.bats

    assert_failure
    assert_line -n 0 'scripts/test … running tests/lib.sh.bats:'
    assert_line -n 1 'Error!'
    assert_line -n 2 'scripts/test ☒ tests/lib.sh.bats failed'
}

@test "scripts/test run_test_set success test" {
    function bats() {
        echo 'OK'
    }
    export -f bats

    run run_test_set full

    assert_success
    last_line="${#lines[@]}"
    ((last_line--))
    assert_line -n 0 'scripts/test … running Full test set:'
    assert_line -n "$last_line" 'scripts/test 🗹 Full test set done'
}

@test "scripts/test run_test_set non-existent test set test" {
    run run_test_set nonsense

    assert_failure
    assert_output 'scripts/test ✗ Unknown test set Nonsense'
}

@test "scripts/test run_test_set failing test set test" {
    function bats() {
        echo 'Error!'
        return 1
    }
    export -f bats

    run run_test_set full

    assert_failure
    assert_line -n 0 'scripts/test … running Full test set:'
    assert_line -n 1 'Error!'
    assert_line -n 2 'scripts/test ☒ Full test set failed'
}

@test "scripts/test usage test" {
    run usage

    assert_success
    assert_line -n 0 'Usage: scripts/test [test-set | path [test-set | path [...]]]'
    assert_line -n 1 '    test-set    Test set name: quick, reduced, full, or nightly'
    assert_line -n 2 '    path        Path to the test file'
}

@test "scripts/test main with zero arguments test" {
    function usage() {
        echo "Usage"
    }
    export -f usage

    run main

    assert_success
    assert_output 'Usage'
}

@test "scripts/test main with test file argument test" {
    function run_test_file() {
        echo "OK: $1"
    }
    export -f run_test_file

    run main 'pass'

    assert_success
    assert_output 'OK: pass'
}

@test "scripts/test main with test set argument test" {
    function run_test_set() {
        echo "OK: $1"
    }
    export -f run_test_set

    run main 'full'

    assert_success
    assert_output 'OK: full'
}

@test "scripts/test main with two arguments success test" {
    function run_test_file() {
        echo "OK: $1"
    }
    function run_test_set() {
        echo "OK: $1"
    }

    export -f run_test_file
    export -f run_test_set

    run main 'pass' 'full'

    assert_success
    assert_line -n 0 'OK: pass'
    assert_line -n 1 'OK: full'
}

@test "scripts/test main with two arguments one failed test" {
    function run_test_file() {
        echo "OK: $1"
    }
    function run_test_set() {
        echo "Err: $1"
        return 1
    }

    export -f run_test_file
    export -f run_test_set

    run main 'pass' 'full'

    assert_failure
    assert_line -n 0 'OK: pass'
    assert_line -n 1 'Err: full'
}
