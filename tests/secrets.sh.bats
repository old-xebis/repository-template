#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export UNDER_TEST=0
    . scripts/secrets.sh
}

@test "scripts/secrets.sh load_secrets test" {
    run load_secrets

    assert_success
    assert_output 'scripts/secrets.sh ✓ Exported secrets: GL_TOKEN'
}

@test "scripts/secrets.sh protect_secrets success test" {
    function git() {
        echo -n
    }
    export -f git

    run protect_secrets

    assert_success
    assert_output 'scripts/secrets.sh ✓ git skip-worktree bit set'
}

@test "scripts/secrets.sh protect_secrets fail test" {
    function git() {
        echo -n
        return 2
    }
    export -f git

    run protect_secrets

    assert_failure
    assert_line -n 0 'scripts/secrets.sh ✗ git skip-worktree bit NOT set'
    assert_line -n 1 'scripts/secrets.sh ☠ Your secrets could be compromised, please make sure they are not commited or pushed!'
}
