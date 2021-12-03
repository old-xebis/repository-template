#!/usr/bin/env bats

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'
    load 'helpers/bats-file/load'
}

@test "test bats-assert" {
    run true

    assert_success
}

@test "test bats-file" {
    assert_exist .
}

@test "test stubbing and mocking" {
    function cat() {
        echo 'It works!'
    }
    export -f cat

    run cat

    assert_success
    assert_output "It works!"
}
