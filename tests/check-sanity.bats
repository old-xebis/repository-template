#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export TEST=1
    export TEST_MOCK_ARGV=('scripts/check-sanity')

    . scripts/check-sanity
}

@test "scripts/check-sanity check_todos success test" {
    function grep() {
        echo -n
    }
    export -f grep

    run check_todos

    assert_success
    assert_output 'scripts/check-sanity ✓ No todos detected'
}

@test "scripts/check-sanity check_todos failure test" {
    function grep() {
        echo -n 'scripts/unfinished:#TO-DO'
        return 1
    }
    export -f grep

    run check_todos

    assert_failure
    assert_line -n 0 'scripts/check-sanity ✗ Anti-todo sanitization failed, todos:'
    assert_line -n 1 'scripts/unfinished:#TO-DO'
}
