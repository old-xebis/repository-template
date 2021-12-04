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
