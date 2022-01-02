# shellcheck shell=bash
script_path="${BASH_SOURCE[0]}"
script_dir=$(dirname "$(readlink -f "$script_path")")
# shellcheck source=./shellib/shellib.sh
. "$script_dir/shellib/shellib.sh"

# Load secrets
function load_secrets() {
    # GitLab Personal Access Token <https://gitlab.com/-/profile/personal_access_tokens> with scope `api`
    export GL_TOKEN=''

    info 'Exported secrets: GL_TOKEN' '' "$script_path"
}

# Try to protect secrets from accidental commit by telling git to not track this file
function protect_secrets() {
    # Set skip-worktree bit on this file to make sure the file wouldn't be commited or pushed, for more information see
    # <https://git-scm.com/docs/git-update-index#_skip_worktree_bit>
    if git update-index --skip-worktree "$script_path"; then
        info 'git skip-worktree bit set' '' "$script_path"
    else
        err 'git skip-worktree bit NOT set' '' "$script_path"
        sec 'Your secrets could be compromised, please make sure they are not commited or pushed!' '' "$script_path"
        return "$status_err"
    fi
}

# Skip execution under test
if [ -z "${UNDER_TEST+x}" ]; then
    load_secrets
    protect_secrets
fi
