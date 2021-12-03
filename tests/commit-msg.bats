#!/usr/bin/env bats
set -e
set -o pipefail
set -u

LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'
}

@test "tools/commit-msg basic test success" {
    function gitlint() {
        echo -n
    }
    export -f gitlint

    run tools/commit-msg commit-msg-file

    assert_success
    refute_output
}

@test "tools/commit-msg basic test error" {
    function gitlint() {
        echo "1: CT1 Title does not start with one of build, chore, ci, docs, feat, fix, perf, refactor, style, test: \"initial commit\"
1: CT1 Title does not follow ConventionalCommits.org format 'type(optional-scope): description': \"initial commit\""
        exit 1
    }
    export -f gitlint

    run tools/commit-msg commit-msg-file

    assert_failure
    assert_line -n 0 -e 'CT1 Title does not start with one of build, chore, ci, docs, feat, fix, perf, refactor, style, test'
    assert_line -n 1 -e "CT1 Title does not follow ConventionalCommits\\.org format"
}
