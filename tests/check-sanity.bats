#!/usr/bin/env bats
set -e
set -o pipefail
set -u

LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'
}

@test "scripts/check-sanity basic test success" {
    function grep() {
        echo -n
    }
    export -f grep

    run scripts/check-sanity

    assert_success
    assert_line -n 0 'scripts/check-sanity ✓ todos sanitization'
}

@test "scripts/check-sanity basic test error" {
    function grep() {
        echo 'unfinished/file:    hash-to-do-mark line'
    }
    export -f grep

    run scripts/check-sanity

    assert_failure
    assert_line -n 0 'scripts/check-sanity ❌ todos sanitization failed:'
    assert_line -n 1 'unfinished/file:    hash-to-do-mark line'
}
