#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'

    . scripts/lib.sh
}

@test "scripts/lib.sh out with one parameter test" {
    run out "OK"
    assert_output "$0 ✓ OK"
}

@test "scripts/lib.sh out with one parameter and mocked zero argument test" {
    export TEST_MOCK_ARGV=('test/script')
    run out "OK"
    assert_output "test/script ✓ OK"
}

@test "scripts/lib.sh out with two parameters test" {
    run out "Error" "$symbol_err"
    assert_output "$0 ✗ Error"
}

@test "scripts/lib.sh out with three parameters test" {
    run out "Info" "$symbol_notice" "test"
    assert_output "test 🛈 Info"
}

@test "scripts/lib.sh err with one parameter test" {
    run err "Err"

    assert_output "$0 ✗ Err"
}

@test "scripts/lib.sh err with two parameters test" {
    run err "Warning" "$symbol_warn"

    assert_output "$0 ⚠ Warning"
}

@test "scripts/lib.sh err with three parameters test" {
    run err "Security warning!" "$symbol_sec" "test"

    assert_output "test ☠ Security warning!"
}
