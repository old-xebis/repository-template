#!/usr/bin/env bats
set -e
set -o pipefail
set -u

LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'
}

@test "tools/update-repo basic test" {
    function git() {
        echo '.'
    }
    export -f git

    function pre-commit() {
        echo 'OK'
    }
    export -f pre-commit

    run tools/update-repo

    output=$(
        . tools/secrets.sh
        echo "GitLab Token = $GL_TOKEN"
    )

    assert_success
    assert_line -n 1 'OK'
    assert_line -n 2 'OK'
}
