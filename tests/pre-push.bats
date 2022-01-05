#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export TEST_ARGV=('scripts/pre-push')

    . scripts/pre-push
}

@test 'scripts/pre-push run_pre_commit success test' {
    function pre-commit() {
        # shellcheck disable=SC2030,SC2031
        if [ -z "${GITLAB_PRIVATE_TOKEN-}" ]; then
            echo 'Error'
        fi
        echo 'OK'
    }
    export -f pre-commit

    export GL_TOKEN='secret'
    run run_pre_commit

    assert_success
    assert_output 'OK'
}

@test 'scripts/pre-push run_pre_commit with skip hook test' {
    function pre-commit() {
        # shellcheck disable=SC2030,SC2031
        if [ -z "${GITLAB_PRIVATE_TOKEN-}" ]; then
            echo 'Skipping skipped-hook'
        fi
        echo 'OK'
    }
    export -f pre-commit

    unset GL_TOKEN
    run run_pre_commit

    assert_success
    assert_line -n 0 'Skipping skipped-hook'
    assert_line -n 1 'OK'
}

@test 'scripts/pre-push run_pre_commit with arguments and stdin test' {
    function pre-commit() {
        cat <&0
    }
    export -f pre-commit

    run run_pre_commit 'origin' 'remote' <<<'Test'

    assert_success
    assert_output 'Test'
}
