#!/usr/bin/env bats
set -e
set -o pipefail
set -u

LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'
}

@test "tools/secrets.sh basic test success" {
    function git() {
        echo -n
    }
    export -f git

    output=$(
        . tools/secrets.sh
        echo "GitLab Token = $GL_TOKEN"
    )

    refute_output 'tools/secrets.sh ✓ Secrets loaded: GL_TOKEN

tools/secrets.sh ✓ skip-worktree bit set
GitLab Token = '
}
