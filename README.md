# Repository Template

Well-manageable and well-maintainable repository template.

## The Purpose

The purpose is to have a template repository and to have it *well-manageable* and *well-maintainable* by both human beings and automation tools.

The rationale behind this is that taking care of tens or hundreds of repositories while keeping them working, tidy, consistent, and up-to-date, might be a daunting task.

The way how to achieve the desired state of manageability and maintainability is to *unify* and *automate* workflow to allow frequent small changes for multiple projects at scale.

Objectives:

- Simple and easy environment check and setup
- Fast and unified code change contribution
- Automated and reliable code change propagation (build, testing, integration, publish, or deployment)

Strategies and tactics to achieve objectives:

1. Automate
2. Automate
3. Automate

## Features

- Automated workflow using [GitLab CI](https://about.gitlab.com/stages-devops-lifecycle/continuous-integration/)
  - GitLab CI skips CI if commit contains `[skip ci]` in the commit message
- Commit messages are checked using [gitlint](https://github.com/jorisroovers/gitlint) and [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- Each codebase change is scanned and rules are applied:
  - Enforces max file size using [pre-commit/pre-commit-hooks: check-added-large-files](https://github.com/pre-commit/pre-commit-hooks#check-added-large-files)
  - Prevents case insensitive filename conflict using [pre-commit/pre-commit-hooks: check-case-conflict](https://github.com/pre-commit/pre-commit-hooks#check-case-conflict)
  - Enforces executables have shebangs using [pre-commit/pre-commit-hooks: check-executables-have-shebangs](https://github.com/pre-commit/pre-commit-hooks#check-executables-have-shebangs)
  - Prevents merge conflict strings using [pre-commit/pre-commit-hooks: check-merge-conflict](https://github.com/pre-commit/pre-commit-hooks#check-merge-conflict)
  - Prevents stale symlinks using [pre-commit/pre-commit-hooks: check-symlinks](https://github.com/pre-commit/pre-commit-hooks#check-symlinks)
  - Prevents non-permanent GitHub links using [pre-commit/pre-commit-hooks: check-vcs-permalinks](https://github.com/pre-commit/pre-commit-hooks#check-vcs-permalinks)
  - Checks YAML using [pre-commit/pre-commit-hooks: check-yaml](https://github.com/pre-commit/pre-commit-hooks#check-yaml)
  - Prevents destroyed symlinks using [pre-commit/pre-commit-hooks: destroyed-symlinks](https://github.com/pre-commit/pre-commit-hooks#destroyed-symlinks)
  - Prevents the existence of private keys using [pre-commit/pre-commit-hooks: detect-private-key](https://github.com/pre-commit/pre-commit-hooks#detect-private-key)
  - Enforces files end with empty newline using [pre-commit/pre-commit-hooks: end-of-file-fixer](https://github.com/pre-commit/pre-commit-hooks#end-of-file-fixer)
  - Prevents UTF8 byte order marker using [pre-commit/pre-commit-hooks: fix-byte-order-marker](https://github.com/pre-commit/pre-commit-hooks#fix-byte-order-marker)
  - Prevents new git submodules [pre-commit/pre-commit-hooks: forbid-new-submodules](https://github.com/pre-commit/pre-commit-hooks#forbid-new-submodules)
  - Converts line endings to LF using [pre-commit/pre-commit-hooks: mixed-line-ending](https://github.com/pre-commit/pre-commit-hooks#mixed-line-ending)
  - Prevents commits to protected branches using [pre-commit/pre-commit-hooks: no-commit-to-branch](https://github.com/pre-commit/pre-commit-hooks#no-commit-to-branch)
  - Prevents trailing whitespaces using [pre-commit/pre-commit-hooks: trailing-whitespace](https://github.com/pre-commit/pre-commit-hooks#trailing-whitespace)
- When merged to `main` branch releases using [semantic-release/semantic-release](https://github.com/semantic-release/semantic-release)
  - Determines major, minor, or patch version bump using [semantic-release/commit-analyzer](https://github.com/semantic-release/commit-analyzer)
  - Generates release notes using [semantic-release/release-notes-generator](https://github.com/semantic-release/release-notes-generator)
  - Generates changelog using [semantic-release/changelog](https://github.com/semantic-release/changelog)
  - Commits changelog and new version using [semantic-release/git](https://github.com/semantic-release/git)
  - Releases new version by tagging using [semantic-release/gitlab](https://github.com/semantic-release/gitlab)
  - Releases new version by tagging using [semantic-release/github](https://github.com/semantic-release/github)
  - Semantic-release skips release if commit contains `[skip release]` or `[release skip]` in the commit message
- Repository `tools/setup-repo` script provides environment check, and setup
- Repository `tools/update-repo` script updates used dependencies

## Setup

### GitLab Releases

Set up [GitLab Personal Access Token](https://gitlab.com/-/profile/personal_access_tokens) with at least scopes `api` and `write_repository` as the group or the project variable:

- Settings
  - CI/CD
    - Variables, *Expand*
      - *Add Variable*:
        - Key: **GL_TOKEN**
        - Value: *token*
        - Flags:
          - Protect variable: **On**

### GitHub Releases

Set up [GitHub Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/about-authentication-to-github#authenticating-with-the-api) with at least scopes `repo` for a private repository or `public_repo` for a public repository, as the group or the project variable:

- Settings
  - CI/CD
    - Variables, *Expand*
      - *Add Variable*:
        - Key: **GH_TOKEN**
        - Value: *token*
        - Flags:
          - Protect variable: **On**

## Authors

[Martin Bružina](https://bruzina.cz/)

## License

[MIT License](LICENSE)

## Dependencies

- [git](https://git-scm.com/)
- [GitLab: The complete DevOps platform](https://about.gitlab.com/)
  - [GitLab: Continuous Integration (CI) with GitLab](https://about.gitlab.com/stages-devops-lifecycle/continuous-integration/)
  - [GitLab: GitLab Runner](https://docs.gitlab.com/runner/)
- [GitHub - semantic-release/semantic-release: Fully automated version management and package publishing](https://github.com/semantic-release/semantic-release)
- [pre-commit: A framework for managing and maintaining multi-language pre-commit hooks](https://pre-commit.com/)
  - [pre-commit: Supported hooks](https://pre-commit.com/hooks.html)
- [GitHub - pre-commit/pre-commit-hooks: Some out-of-the-box hooks for pre-commit](https://github.com/pre-commit/pre-commit-hooks)
- [GitHub - jorisroovers/gitlint: Linting for your git commit messages](https://github.com/jorisroovers/gitlint)

### Recommended

- [Commitizen](https://commitizen-tools.github.io/commitizen/)

## See Also

- [Git - Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
- [Conventional Commits - Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)
- [Semantic Versioning - Semantic Versioning 2.0.0](https://semver.org/)
