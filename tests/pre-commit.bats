#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export TEST=1
    export TEST_MOCK_ARGV=('scripts/pre-commit')

    . scripts/pre-commit
}

@test "scripts/pre-commit run_pre-commit test" {
    function pre-commit() {
        if [ -z "${GITLAB_PRIVATE_TOKEN:-}" ]; then
            echo "Error"
        fi
        echo 'OK'
    }
    export -f pre-commit

    export GITLAB_PRIVATE_TOKEN='secret'
    run run_pre-commit

    assert_success
    assert_output 'OK'
}

@test "scripts/pre-commit run_pre-commit with skip hook test" {
    function pre-commit() {
        if [ "${SKIP_HOOK:-}" == 'skipped-hook' ]; then
            echo 'Skipping skipped-hook'
        fi
        echo 'OK'
    }
    export -f pre-commit

    export SKIP_HOOK='skipped-hook'
    run run_pre-commit

    assert_success
    assert_line -n 0 'Skipping skipped-hook'
    assert_line -n 1 'OK'
}

@test "scripts/pre-commit run_tests success test" {
    function bats() {
        echo 'OK'
    }
    export -f bats

    run run_tests

    assert_success
    assert_line -n 0 'OK'
    assert_line -n 1 'scripts/pre-commit ✓ Quick test set'
}

@test "scripts/pre-commit run_tests fail test" {
    function bats() {
        echo 'Error!'
        return 1
    }
    export -f bats

    run run_tests

    assert_failure
    assert_line -n 0 'Error!'
    assert_line -n 1 'scripts/pre-commit ✗ Quick test set failed'
}
