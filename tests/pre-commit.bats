#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export UNDER_TEST=0
    export TEST_MOCK_ARGV=('scripts/pre-commit')

    . scripts/pre-commit
}

@test 'scripts/pre-commit run_pre-commit test' {
    function pre-commit() {
        if [ -z "${GITLAB_PRIVATE_TOKEN:-}" ]; then
            echo 'Error'
        fi
        echo 'OK'
    }
    export -f pre-commit

    export GITLAB_PRIVATE_TOKEN='secret'
    run run_pre-commit

    assert_success
    assert_output 'OK'
}

@test 'scripts/pre-commit run_pre-commit with skip hook test' {
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
