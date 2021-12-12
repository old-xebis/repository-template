#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    export TEST=1
    . scripts/bootstrap
}

@test "scripts/setup install_dependencies test" {
    skip
}
