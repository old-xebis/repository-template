#!/usr/bin/env bash
# shellcheck disable=SC2317
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export TEST_ARGV=('scripts/test')

    . scripts/test
}

@test 'scripts/test run_test_file success test' {
    run run_test_file tests/update.bats

    assert_success
    last_line="${#lines[@]}"
    ((last_line--))
    assert_line -n 0 'scripts/test … running test file tests/update.bats:'
    assert_line -n "$last_line" 'scripts/test 🗹 tests/update.bats done'
}

@test 'scripts/test run_test_file non-existent file test' {
    run run_test_file nonsense

    assert_failure
    assert_output 'scripts/test ✗ Could not run test file nonsense'
}

@test 'scripts/test run_test_file failing test file test' {
    function bats() {
        echo 'Error!'
        return 1
    }
    export -f bats

    run run_test_file tests/update.bats

    assert_failure
    assert_line -n 0 'scripts/test … running test file tests/update.bats:'
    assert_line -n 1 'Error!'
    assert_line -n 2 'scripts/test ☒ tests/update.bats failed'
}

@test 'scripts/test run_test_set success test' {
    function bats() {
        echo 'OK'
    }
    export -f bats

    run run_test_set tests/fast.set

    assert_success
    last_line="${#lines[@]}"
    ((last_line--))
    assert_line -n 0 'scripts/test … running test set tests/fast.set'
}

@test 'scripts/test run_test_set non-existent test set test' {
    run run_test_set nonsense

    assert_failure
    assert_output 'scripts/test ✗ Could not run test set nonsense'
}

@test 'scripts/test run_test_set failing test set test' {
    function bats() {
        echo 'Error!'
        return 1
    }
    export -f bats

    run run_test_set tests/fast.set

    assert_failure
    assert_line -n 0 'scripts/test … running test set tests/fast.set'
    assert_line -n 2 'Error!'
}

@test 'scripts/test run_test success file test' {
    run run_test tests/update.bats

    assert_success
    last_line="${#lines[@]}"
    ((last_line--))
    assert_line -n 0 'scripts/test … running test file tests/update.bats:'
    assert_line -n "$last_line" 'scripts/test 🗹 tests/update.bats done'
}

@test 'scripts/test run_test success set test' {
    function bats() {
        echo 'OK'
    }
    export -f bats

    run run_test tests/fast.set

    assert_success
    last_line="${#lines[@]}"
    ((last_line--))
    assert_line -n 0 'scripts/test … running test set tests/fast.set'
}

@test 'scripts/test run_test non-existent test type test' {
    run run_test nonsense

    assert_failure
    assert_line -n 0 'scripts/test ✗ Unknown test type nonsense'
    assert_line -n 1 'Usage: scripts/test [path [...]]]'
    assert_line -n 2 '    path  Path to test file or test set'
}

@test 'scripts/test run_test non-existent test' {
    run run_test nonsense.bats

    assert_failure
    assert_output 'scripts/test ✗ Could not run test file nonsense.bats'
}

@test 'scripts/test usage test' {
    run usage

    assert_success
    assert_line -n 0 'Usage: scripts/test [path [...]]]'
    assert_line -n 1 '    path  Path to test file or test set'
}

@test 'scripts/test main with zero arguments test' {
    function usage() {
        echo 'Usage'
    }
    export -f usage

    run main

    assert_success
    assert_output 'Usage'
}

@test 'scripts/test main with test file argument test' {
    function run_test_file() {
        echo "OK: $1"
    }
    export -f run_test_file

    run main 'tests/update.bats'

    assert_success
    assert_output 'OK: tests/update.bats'
}

@test 'scripts/test main with test set argument test' {
    function run_test_set() {
        echo "OK: $1"
    }
    export -f run_test_set

    run main 'tests/fast.set'

    assert_success
    assert_output 'OK: tests/fast.set'
}

@test 'scripts/test main with two arguments success test' {
    function run_test_file() {
        echo "OK: $1"
    }
    function run_test_set() {
        echo "OK: $1"
    }

    export -f run_test_file
    export -f run_test_set

    run main 'tests/update.bats' 'tests/fast.set'

    assert_success
    assert_line -n 0 'OK: tests/update.bats'
    assert_line -n 1 'OK: tests/fast.set'
}

@test 'scripts/test main with two arguments one failed test' {
    function run_test_file() {
        echo "OK: $1"
    }
    function run_test_set() {
        echo "Err: $1"
        return 1
    }

    export -f run_test_file
    export -f run_test_set

    run main 'tests/update.bats' 'tests/fast.set'

    assert_failure
    assert_line -n 0 'OK: tests/update.bats'
    assert_line -n 1 'Err: tests/fast.set'
}
