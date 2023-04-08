#!/usr/bin/env bash
# shellcheck disable=SC2317
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export TEST_ARGV=('scripts/pre-commit')

    . scripts/pre-commit
}

@test 'scripts/pre-commit run_pre_commit test' {
    function pre-commit() {
        # shellcheck disable=SC2030,SC2031
        if [ -z "${GL_TOKEN:-}" ]; then
            echo 'Error'
        fi
        # shellcheck disable=SC2030,SC2031
        if [ -n "${SKIP:-}" ]; then
            echo "Skipping $SKIP"
        fi
        echo 'OK'
    }
    export -f pre-commit

    # shellcheck disable=SC2030,SC2031
    export GL_TOKEN='secret'
    unset SKIP
    run run_pre_commit

    assert_success
    assert_output 'OK'
}

@test 'scripts/pre-commit run_pre_commit skipped hook test' {
    function pre-commit() {
        # shellcheck disable=SC2030,SC2031
        if [ -z "${GL_TOKEN:-}" ]; then
            echo 'Error'
        fi
        # shellcheck disable=SC2030,SC2031
        if [ -n "${SKIP:-}" ]; then
            echo "Skipping $SKIP"
        fi
        echo 'OK'
    }
    export -f pre-commit

    # shellcheck disable=SC2030,SC2031
    export GL_TOKEN='secret'
    # shellcheck disable=SC2030,SC2031
    export SKIP='skipped-hook'
    run run_pre_commit

    assert_success
    assert_line -n 0 'Skipping skipped-hook'
    assert_line -n 1 'OK'
}

@test 'scripts/pre-commit run_pre_commit without GitLab token should skip gitlab-ci-linter test' {
    function pre-commit() {
        # shellcheck disable=SC2030,SC2031
        if [ -n "${SKIP:-}" ]; then
            echo "Skipping $SKIP"
        fi
        echo 'OK'
    }
    export -f pre-commit

    unset GL_TOKEN
    unset SKIP
    run run_pre_commit

    assert_success
    assert_line -n 0 'Skipping gitlab-ci-linter'
    assert_line -n 1 'OK'
}

@test 'scripts/pre-commit run_pre_commit without GitLab token and skipped hook should skip both test' {
    function pre-commit() {
        # shellcheck disable=SC2030,SC2031
        if [ -n "${SKIP:-}" ]; then
            # shellcheck disable=SC2030,SC2031
            echo "Skipping $SKIP"
        fi
        echo 'OK'
    }
    export -f pre-commit

    unset GL_TOKEN
    # shellcheck disable=SC2030,SC2031
    export SKIP='skipped-hook'
    run run_pre_commit

    assert_success
    assert_line -n 0 'Skipping skipped-hook,gitlab-ci-linter'
    assert_line -n 1 'OK'
}
