#!/usr/bin/env bats
set -e
set -o pipefail
set -u

LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'
}

@test "scripts/secrets.sh basic test success" {
    function git() {
        echo -n
    }
    export -f git

    output=$(
        . scripts/secrets.sh
        echo "GitLab Token = ${GL_TOKEN:-}"
    )

    refute_output 'scripts/secrets.sh ✓ Secrets loaded: GL_TOKEN

scripts/secrets.sh ✓ skip-worktree bit set
GitLab Token = '
}
