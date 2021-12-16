#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    . scripts/update
}

@test 'scripts/update update_pre_commit test' {
    function pre-commit() {
        echo 'OK'
    }
    export -f pre-commit

    run update_pre_commit

    assert_success
    assert_line -n 0 'OK'
    assert_line -n 1 'OK'
}

@test 'scripts/update update_git_submodules test' {
    function git() {
        echo 'OK'
    }
    export -f git

    run update_git_submodules

    assert_success
    assert_output 'OK'
}
