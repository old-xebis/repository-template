#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export TEST_ARGV=('scripts/setup')

    . scripts/setup
}

@test 'scripts/setup setup test' {
    skip
}

@test 'scripts/setup main under root user test' {
    function is_root() {
        return 0
    }
    export -f is_root

    run main

    assert_failure
    assert_output "scripts/setup ✗ Superpowers might be more harmful than useful. Please run as a regular user."
}

@test 'scripts/setup main under non-root user test' {
    function is_root() {
        return 1
    }
    export -f is_root

    function setup() {
        return 0
    }
    export -f setup

    run main

    assert_success
    refute_output
}
