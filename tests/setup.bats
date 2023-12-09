#!/usr/bin/env bash
# shellcheck disable=SC2317
set -euo pipefail
IFS=$'\n\t'
LANG=C

setup() {
    load 'helpers/bats-support/load'
    load 'helpers/bats-assert/load'
    load 'helpers/bats-file/load'

    export TEST_ARGV=('scripts/setup')

    . scripts/setup
}

@test 'scripts/setup setup_hook hook exists success test' {
    local hook='test'
    local file=".git/hooks/$hook"

    [ -d '.git/hooks' ] || mkdir -p '.git/hooks'
    setup_hook "$hook"
    run setup_hook "$hook"
    rm "$file"

    assert_success
    assert_line -n 0 "scripts/setup ✓ $hook hook is installed"
}

@test 'scripts/setup setup_hook hook exists failed test' {
    local hook='test'
    local file=".git/hooks/$hook"

    [ -d '.git/hooks' ] || mkdir -p '.git/hooks'
    touch "$file"
    run setup_hook "$hook"
    rm "$file"

    assert_failure
    assert_line -n 0 "scripts/setup ☒ $hook cannot be installed"
    assert_line -n 1 "scripts/setup 💡 Try to remove '.git/hooks/$hook' first"
}

@test 'scripts/setup setup_hook hook installation failed test' {
    local hook='test/'
    local file=".git/hooks/$hook"

    [ -d '.git/hooks' ] || mkdir -p '.git/hooks'
    run setup_hook "$hook"

    assert_not_exist "$file"
    assert_failure
    assert_line -n 1 "scripts/setup ☒ $hook hook installation failed, cannot create symbolic link"
}

@test 'scripts/setup setup_hook hook installation success test' {
    local hook='test'
    local file=".git/hooks/$hook"

    [ -d '.git/hooks' ] || mkdir -p '.git/hooks'
    run setup_hook "$hook"

    assert_link_exist "$file"
    rm "$file"
    assert_success
    assert_output 'scripts/setup 🗹 test hook has been installed'
}

@test 'scripts/setup setup pre-commit install failed test' {
    function pre-commit() {
        return 1
    }
    export -f pre-commit

    run setup

    assert_failure
    assert_output 'scripts/setup ✗ commit-msg hook installation failed'
}

@test 'scripts/setup setup setup_hook failed test' {
    function pre-commit() {
        return 0
    }
    export -f pre-commit

    function git() {
        pwd
    }
    export -f git

    function setup_hook() {
        err 'setup hook installation failed'
        return 1
    }

    run setup

    assert_failure
    assert_line -n 0 'scripts/setup ✓ commit-msg hook is installed'
    assert_line -n 1 'scripts/setup ✗ setup hook installation failed'
}

@test 'scripts/setup setup without GL_TOKEN set success test' {
    function pre-commit() {
        return 0
    }
    export -f pre-commit

    function git() {
        pwd
    }
    export -f git

    function setup_hook() {
        return 0
    }

    unset GL_TOKEN

    run setup

    assert_success
    assert_line -n 0 'scripts/setup ✓ commit-msg hook is installed'
    assert_line -n 1 'scripts/setup 🛈 environment variable GL_TOKEN is not set, pre-commit hook gitlab-ci-linter will be skipped'
    assert_line -n 2 'scripts/setup 💡 You might set up environment variable GL_TOKEN'
}

@test 'scripts/setup setup with GL_TOKEN set success test' {
    function pre-commit() {
        return 0
    }
    export -f pre-commit

    function git() {
        pwd
    }
    export -f git

    function setup_hook() {
        return 0
    }

    export GL_TOKEN='******'

    run setup

    assert_success
    assert_line -n 0 'scripts/setup ✓ commit-msg hook is installed'
    assert_line -n 1 'scripts/setup ✓ GL_TOKEN is set'
}

@test 'scripts/setup main under root user test' {
    function is_root() {
        return 0
    }
    export -f is_root

    run main

    assert_failure
    assert_line -n 0 "scripts/setup ✗ Shouldn't be run as root"
    assert_line -n 1 "scripts/setup 💡 Try again as non-root"
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
