# [0.26.0](https://gitlab.com/xebis/repository-template/compare/v0.25.0...v0.26.0) (2023-04-08)


### Bug Fixes

* cspell warnings ([fbedcf3](https://gitlab.com/xebis/repository-template/commit/fbedcf384ac813a5cfff3aea9e71464f38abbc07))
* shellcheck warns about unreachable command in tests ([94cc929](https://gitlab.com/xebis/repository-template/commit/94cc92958c7ba3c4d93166669bbd8f119c8c813c))
* when a hook is installed setup script has a wrong icon ([86b113b](https://gitlab.com/xebis/repository-template/commit/86b113b16e34320c00d194ec405432b2a813ac5c))


### Features

* add .editorconfig ([b5b2894](https://gitlab.com/xebis/repository-template/commit/b5b2894327d6863405f1d5bcd00b0ef8aabfe6d6))
* json validation and linting ([6e7af63](https://gitlab.com/xebis/repository-template/commit/6e7af631576c1e5ad522d5f8fbf9255d0f0b06da))

# [0.25.0](https://gitlab.com/xebis/repository-template/compare/v0.24.0...v0.25.0) (2023-02-04)


### Features

* add codespell pre-commit hook ([76bb588](https://gitlab.com/xebis/repository-template/commit/76bb5885d321197a1820498349887fff747822f5))

# [0.24.0](https://gitlab.com/xebis/repository-template/compare/v0.23.1...v0.24.0) (2022-10-09)


### Features

* add pre-commit useless excludes check ([a72a834](https://gitlab.com/xebis/repository-template/commit/a72a834cf006b5ae0892888740934ac466632d80))

## [0.23.1](https://gitlab.com/xebis/repository-template/compare/v0.23.0...v0.23.1) (2022-08-14)


### Bug Fixes

* skip pre-commit hook variable doesn't work without gitlab token ([845da3f](https://gitlab.com/xebis/repository-template/commit/845da3f3839dc574404d27a748de7446263f3758))

# [0.23.0](https://gitlab.com/xebis/repository-template/compare/v0.22.0...v0.23.0) (2022-01-07)


### Features

* secrets.sh symbols better match shellib's style ([6707322](https://gitlab.com/xebis/repository-template/commit/67073223278b94d520d0474e181a09b6619af8e0))

# [0.22.0](https://gitlab.com/xebis/repository-template/compare/v0.21.0...v0.22.0) (2022-01-05)


### Features

* add pre-commit hooks git-check, git-dirty, protect-first-parent ([2a6e4a9](https://gitlab.com/xebis/repository-template/commit/2a6e4a9af4bfa10a8e46c4e6cbc203a3672f66e3))
* remove pre-push unstaged files check, pre-commit warning is enough ([f534123](https://gitlab.com/xebis/repository-template/commit/f534123d991470d7e69ea205f9fcb546ecbcfd42))

# [0.21.0](https://gitlab.com/xebis/repository-template/compare/v0.20.0...v0.21.0) (2022-01-03)


### Bug Fixes

* scripts/update failed on unspecified shellib branch ([3f580e0](https://gitlab.com/xebis/repository-template/commit/3f580e0fa5b018eb29cb2ebabdcc6fa8a9ea192f))


### Features

* switch from own package management to shellib pkgs ([efc518e](https://gitlab.com/xebis/repository-template/commit/efc518e6f7956bd38b533321df59155a01bb2339))

# [0.20.0](https://gitlab.com/xebis/repository-template/compare/v0.19.1...v0.20.0) (2021-12-19)


### Features

* add shellib ([bd555a5](https://gitlab.com/xebis/repository-template/commit/bd555a5c7f3eee8f64374d1ad1bca56417052667))

## [0.19.1](https://gitlab.com/xebis/repository-template/compare/v0.19.0...v0.19.1) (2021-12-19)


### Bug Fixes

* scripts/setup remove unnecessary output ([12d712c](https://gitlab.com/xebis/repository-template/commit/12d712c7f397f310c209311c3a8d48d6272427d2))

# [0.19.0](https://gitlab.com/xebis/repository-template/compare/v0.18.0...v0.19.0) (2021-12-16)


### Bug Fixes

* pre-commit script test fails on env var collision with bats ([d57fc8a](https://gitlab.com/xebis/repository-template/commit/d57fc8a129a0bff11f37b66fd3628aa7addcb85b))
* pre-push hook should run pre-commit hooks on changed, not all files ([531b584](https://gitlab.com/xebis/repository-template/commit/531b584e65d785c827ec77f3c8617d8299e5b1cd))
* pre-push hook should run pre-commit hooks on changed, not all files ([c34c0d6](https://gitlab.com/xebis/repository-template/commit/c34c0d665c1810bd440e649ea53893dc1877ce65))
* pre-push hook skips changed files ([acc8021](https://gitlab.com/xebis/repository-template/commit/acc8021691cd9ece4f641724c085c1974a063d6c))
* refactored scripts fails on non-existent environment variable ([f2cd6a1](https://gitlab.com/xebis/repository-template/commit/f2cd6a1d1cbd475fcee5f35efb2858766c7d5767))
* shellcheck fails on included scripts ([e40610a](https://gitlab.com/xebis/repository-template/commit/e40610a1e811ce2b40d9917ff25e57999071ea3c))


### Features

* add git-merge-commit hook ([9a3be21](https://gitlab.com/xebis/repository-template/commit/9a3be21f0ec7699d432af075dd0b93348c4d6a57))
* add gitleaks pre-commit hook ([b402316](https://gitlab.com/xebis/repository-template/commit/b40231671bf636703dd58c4a68a6609b55afee34))
* add scripts/test test runner ([07e5554](https://gitlab.com/xebis/repository-template/commit/07e55545e731559eb8cf69e955a06ee5c790b232))
* anti-todo hook checks word boundaries and replaces check-sanity ([a05773d](https://gitlab.com/xebis/repository-template/commit/a05773d6b5f964b41a0de0f510e90850a2a47a65))
* rename tools to scripts ([bffa6e4](https://gitlab.com/xebis/repository-template/commit/bffa6e413c54d4abf4709e7a1216855112f81879))
* rename, rewrite, and refactor scripts/check-sanity ([2513adc](https://gitlab.com/xebis/repository-template/commit/2513adc7e00299e33f37106291930319dbb1bf6e))
* rename, rewrite, and refactor scripts/pre-commit ([1664a1d](https://gitlab.com/xebis/repository-template/commit/1664a1d3d5459bf1612908c75b8b2e7127e1442b))
* rename, rewrite, and refactor scripts/update ([52a657e](https://gitlab.com/xebis/repository-template/commit/52a657e1e04e25a8eb5626246390b2a71ef02b3f))
* rewrite, and refactor scripts/pre-push ([59a24f3](https://gitlab.com/xebis/repository-template/commit/59a24f3a42fddff669dd92d799a16214e0c28232))
* split setup-repo to bootstrap and setup scripts ([f85da8a](https://gitlab.com/xebis/repository-template/commit/f85da8a1fdbd5e6ee0eeaa17cf3a82869e012ace))

# [0.18.0](https://gitlab.com/xebis/repository-template/compare/v0.17.2...v0.18.0) (2021-12-04)


### Features

* pre-releases and maintenance releases ([c96f563](https://gitlab.com/xebis/repository-template/commit/c96f5638ce52c18f14cacfc62ff0f9f92c366ad0))

# [0.18.0-beta.1](https://gitlab.com/xebis/repository-template/compare/v0.17.2...v0.18.0-beta.1) (2021-12-04)


### Features

* pre-releases and maintenance releases ([c96f563](https://gitlab.com/xebis/repository-template/commit/c96f5638ce52c18f14cacfc62ff0f9f92c366ad0))

## [0.17.2](https://gitlab.com/xebis/repository-template/compare/v0.17.1...v0.17.2) (2021-12-04)


### Bug Fixes

* tools/check-sanity shouldn't traverse through hidden directories ([70105c4](https://gitlab.com/xebis/repository-template/commit/70105c4fa54e2208036cddf63f85ed465795cce7))

## [0.17.1](https://gitlab.com/xebis/repository-template/compare/v0.17.0...v0.17.1) (2021-12-04)


### Bug Fixes

* add misssing git submodules update ([5b186d2](https://gitlab.com/xebis/repository-template/commit/5b186d25c0315bf973daf5660bf883d3824ceaaf))

# [0.17.0](https://gitlab.com/xebis/repository-template/compare/v0.16.0...v0.17.0) (2021-12-03)


### Bug Fixes

* bats files are formatted as well ([e3a4567](https://gitlab.com/xebis/repository-template/commit/e3a4567d1a87ce25c2df198a799ad28b9363523f))
* lint fails on script-must-have-extension pre-commit hook ([9cc2ce0](https://gitlab.com/xebis/repository-template/commit/9cc2ce09ab0d585672e240b37d9eb1902eaebbb0))
* lint fails on shfmt pre-commit hook ([ca1f033](https://gitlab.com/xebis/repository-template/commit/ca1f033755dd8e1b9452a433c5863a55f5b62fa9))


### Features

* add bats ([c5083b3](https://gitlab.com/xebis/repository-template/commit/c5083b38f5e1a74f6ac13951d02b0feed4162d33))
* add bats-support, bats-assert, and bats-file test helpers ([27f546c](https://gitlab.com/xebis/repository-template/commit/27f546cab564f1dd869ac74271e6df7aa1875f16))

# [0.16.0](https://gitlab.com/xebis/repository-template/compare/v0.15.0...v0.16.0) (2021-11-29)


### Bug Fixes

* sourcing tools/secrets.sh lead to unexpected shell exits ([e550540](https://gitlab.com/xebis/repository-template/commit/e550540c350efda767e3c208578c128680a34702))


### Features

* add check-mailmap pre-commit hook ([f6ed3fe](https://gitlab.com/xebis/repository-template/commit/f6ed3fe430acb41e50d7526b4ebaf74fdc2a1294))
* rename tools script load-secrets.sh to secrets.sh ([1fc4cd5](https://gitlab.com/xebis/repository-template/commit/1fc4cd5d5929742562a0df7c2247f851afd8a6c6))

# [0.15.0](https://gitlab.com/xebis/repository-template/compare/v0.14.3...v0.15.0) (2021-11-21)


### Features

* add tools/load-secrets script ([871059d](https://gitlab.com/xebis/repository-template/commit/871059d6ae3f44b468335bd4f6607fb1da05ec4a))

## [0.14.3](https://gitlab.com/xebis/repository-template/compare/v0.14.2...v0.14.3) (2021-10-31)


### Bug Fixes

* don't miss yaml to be done tags with a leading space ([3b00e5e](https://gitlab.com/xebis/repository-template/commit/3b00e5eadb490bd3c9c9d09d9807b9db3212be8a))

## [0.14.2](https://gitlab.com/xebis/repository-template/compare/v0.14.1...v0.14.2) (2021-07-09)


### Bug Fixes

* gitlab ci linter is not skipped when gitlab personal token is set ([c374fca](https://gitlab.com/xebis/repository-template/commit/c374fca04c12c2415f4067410738d80e9d3a12d5))

## [0.14.1](https://gitlab.com/xebis/repository-template/compare/v0.14.0...v0.14.1) (2021-06-11)


### Bug Fixes

* update-repo should have pre-commit update first, gc last ([859a2e2](https://gitlab.com/xebis/repository-template/commit/859a2e2054b20af116c5c383f3031e677e1dade6))

# [0.14.0](https://gitlab.com/xebis/repository-template/compare/v0.13.0...v0.14.0) (2021-06-10)


### Bug Fixes

* add temporary skipping gitlab-ci-linter ([06a570b](https://gitlab.com/xebis/repository-template/commit/06a570b66c674cfb4c4b722fa4725fe61fd30d9c))
* ignore todos at binary files ([700a630](https://gitlab.com/xebis/repository-template/commit/700a630b15345c2884db33bef39d5ce127080e4a))


### Features

* add tools update-repo pre-commit gc ([ac6f5cc](https://gitlab.com/xebis/repository-template/commit/ac6f5cc8838cdea75dbf4cf67ad1b6f57e8d4811))

# [0.13.0](https://gitlab.com/xebis/repository-template/compare/v0.12.0...v0.13.0) (2021-05-22)


### Bug Fixes

* setup-repo, update-repo don't work out of the repo root ([d6dda69](https://gitlab.com/xebis/repository-template/commit/d6dda69d1cb8516765c9aec62e916d356e388d89))


### Features

* update pre-commit hooks to v4.0.1 ([445b985](https://gitlab.com/xebis/repository-template/commit/445b985f1566aa066eb5046e594c089ec4b9c6aa))

# [0.12.0](https://gitlab.com/xebis/repository-template/compare/v0.11.2...v0.12.0) (2021-05-12)


### Features

* add contributing and code of conduct ([778c360](https://gitlab.com/xebis/repository-template/commit/778c3608a89f38dca81f52db3388676594162235))
* add license templates ([58d6cff](https://gitlab.com/xebis/repository-template/commit/58d6cff0f63836bfadf47a774343151dcbdcad1f))
* add readme template ([25f1649](https://gitlab.com/xebis/repository-template/commit/25f1649747151b87fd4e76a8deff73e559f3d717))

## [0.11.2](https://gitlab.com/xebis/repository-template/compare/v0.11.1...v0.11.2) (2021-05-09)


### Bug Fixes

* setup-repo script misses sudo ([40e608c](https://gitlab.com/xebis/repository-template/commit/40e608c38bd69c0eb8d29f161e3535fdd07c36b6))

## [0.11.1](https://gitlab.com/xebis/repository-template/compare/v0.11.0...v0.11.1) (2021-04-24)


### Bug Fixes

* gitlint fails on release commits from semantic-release ([01b6018](https://gitlab.com/xebis/repository-template/commit/01b6018e8f808a040d7a3f6e71b761e8e45843ba))

# [0.11.0](https://gitlab.com/xebis/repository-template/compare/v0.10.0...v0.11.0) (2021-04-24)


### Features

* add ci schedule runs nightly test set ([aa2a745](https://gitlab.com/xebis/repository-template/commit/aa2a7450b1b0f7e3714e38ae2128f289fdc9fa57))

# [0.10.0](https://gitlab.com/xebis/repository-template/compare/v0.9.0...v0.10.0) (2021-04-24)


### Features

* add gitlab ci runs full test set ([4ed1651](https://gitlab.com/xebis/repository-template/commit/4ed165187e42ac644b13b64e941f8a26e5b1e702))
* add pre-commit runs quick test set ([328fb5f](https://gitlab.com/xebis/repository-template/commit/328fb5fc20bada7d24bcb26a2488c2b1bac116f7))
* add pre-push runs reduced test set ([0bd0f89](https://gitlab.com/xebis/repository-template/commit/0bd0f8917da3b372cad840acb48f0beb1601f54e))

# [0.9.0](https://gitlab.com/xebis/repository-template/compare/v0.8.0...v0.9.0) (2021-04-24)


### Bug Fixes

* ci should perform sanity check as well ([af503ed](https://gitlab.com/xebis/repository-template/commit/af503ed0f35390fb8566dab719ad4f1ec25a0799))


### Features

* add pre-push hook with additional checks ([4310948](https://gitlab.com/xebis/repository-template/commit/4310948c096a2b076dcb3cbcc199b2b2ca3aa919))

# [0.8.0](https://gitlab.com/xebis/repository-template/compare/v0.7.0...v0.8.0) (2021-04-24)


### Bug Fixes

* ci fails on shfmt not found ([0853877](https://gitlab.com/xebis/repository-template/commit/08538771fcd45d0b421745e319f0fdc9a4b0d8d4))


### Features

* add shfmt and shellcheck ([a219ad9](https://gitlab.com/xebis/repository-template/commit/a219ad9857ca51f7fe24b4fd7a8bf4647bd68951))

# [0.7.0](https://gitlab.com/xebis/repository-template/compare/v0.6.0...v0.7.0) (2021-04-24)


### Features

* add gitlab ci linter ([c7e8119](https://gitlab.com/xebis/repository-template/commit/c7e8119ee401ff456e334feb0bdb2b3d1ee02e16))

# [0.6.0](https://gitlab.com/xebis/repository-template/compare/v0.5.0...v0.6.0) (2021-04-24)


### Features

* add yamllint ([c0daf9b](https://gitlab.com/xebis/repository-template/commit/c0daf9b020a4cfeca63a1a31a3ddc8b56ea8becd))

# [0.5.0](https://gitlab.com/xebis/repository-template/compare/v0.4.0...v0.5.0) (2021-04-24)


### Features

* add markdownlint ([0e5ed4e](https://gitlab.com/xebis/repository-template/commit/0e5ed4ee1d3daa80418226faee1e263014b8d725))

# [0.4.0](https://gitlab.com/xebis/repository-template/compare/v0.3.0...v0.4.0) (2021-04-24)


### Features

* add jumanjihouse pre-commit hooks ([532eec1](https://gitlab.com/xebis/repository-template/commit/532eec108e89f7bc1eacca91736a549f843932b0))
* add more pre-commit hooks ([aa2bf32](https://gitlab.com/xebis/repository-template/commit/aa2bf321ff5dc804d9f0af89ba4b65f67d44321f))

# [0.3.0](https://gitlab.com/xebis/repository-template/compare/v0.2.0...v0.3.0) (2021-04-23)


### Features

* add gitlint ([3a58bf2](https://gitlab.com/xebis/repository-template/commit/3a58bf23994a734dffe3220ef199675f89caa808))

# [0.2.0](https://gitlab.com/xebis/repository-template/compare/v0.1.0...v0.2.0) (2021-04-23)


### Features

* add pre-commit hooks installation to git hooks ([cf9aa7c](https://gitlab.com/xebis/repository-template/commit/cf9aa7c54f1d1db1f683416cd9c44ca7505e715d))
* add setup-repo script ([70e9427](https://gitlab.com/xebis/repository-template/commit/70e9427dc97d6b9a0495e9c678d32db9526bb3ec))
* add update-repo script ([3d0945d](https://gitlab.com/xebis/repository-template/commit/3d0945d3539eb7f83cf1fd6f29129d8d772fd63c))

# [0.1.0](https://gitlab.com/xebis/repository-template/compare/v0.0.0...v0.1.0) (2021-04-23)


### Bug Fixes

* add missing ci git installation ([d367743](https://gitlab.com/xebis/repository-template/commit/d36774353017183b27377eaa33e705756203be91))


### Features

* add semantic releases to gitlab, github when merged to main ([cdb6007](https://gitlab.com/xebis/repository-template/commit/cdb600778dea50709fbc454044cca271efafca2e))
