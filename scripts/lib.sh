# shellcheck shell=bash

# shellcheck disable=SC2034
{
    # Global constants
    # Status codes
    readonly status_err=1

    # Symbols
    readonly symbol_ok="✓"
    readonly symbol_notice="🛈"
    readonly symbol_warn="⚠"
    readonly symbol_sec="☠"
    readonly symbol_err="✗"
} 2>/dev/null

# Functions
# Output "script symbol message" to stdout
#   $1 ... string message
#   [$2] ... symbol, one of symbol_* constants, default symbol_ok
#   [$3] ... script, default $0
# Stdout: "script symbol message"
function out() {
    echo "${3:-$0} ${2:-$symbol_ok} $1"
}

# Output "script symbol message" to stderr
#   $1 ... string message
#   [$2] ... symbol, one of symbol_* constants, default symbol_err
#   [$3] ... script, default $0
# Stderr: "script symbol message"
function err() {
    echo "${3:-$0} ${2:-$symbol_err} $1"
}
