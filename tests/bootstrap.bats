#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export TEST_ARGV=('scripts/bootstrap')

    . scripts/bootstrap
}

@test 'scripts/bootstrap install_dependencies test' {
    skip
}

@test 'scripts/bootstrap main under root user test' {
    function is_root() {
        return 0
    }
    export -f is_root

    run main

    assert_failure
    assert_output "scripts/bootstrap ✗ Superpowers might be more harmful than useful. Please run as a regular user."
}

@test 'scripts/bootstrap main under non-root user test' {
    function is_root() {
        return 1
    }
    export -f is_root

    function install_dependencies() {
        return 0
    }
    export -f install_dependencies

    run main

    assert_success
    refute_output
}
