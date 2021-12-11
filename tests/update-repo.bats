#!/usr/bin/env bats
set -e
set -o pipefail
set -u

LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'
}

@test "scripts/update-repo basic test" {
    function git() {
        if [ "$1" = 'rev-parse' ]; then
            echo '.'
        else
            echo -n
        fi
    }
    export -f git

    function pre-commit() {
        echo 'OK'
    }
    export -f pre-commit

    run scripts/update-repo

    output=$(
        . scripts/secrets.sh
        echo "GitLab Token = ${GL_TOKEN:-}"
    )

    assert_success
    assert_line -n 1 'OK'
    assert_line -n 2 'OK'
}
