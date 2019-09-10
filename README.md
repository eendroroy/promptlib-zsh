# promptlib-zsh

[![Contributors](https://img.shields.io/github/contributors/eendroroy/promptlib-zsh.svg)](https://github.com/eendroroy/promptlib-zsh/graphs/contributors)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/eendroroy/promptlib-zsh/master.svg)](https://github.com/eendroroy/promptlib-zsh)
[![license](https://img.shields.io/github/license/eendroroy/promptlib-zsh.svg)](https://github.com/eendroroy/promptlib-zsh/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/eendroroy/promptlib-zsh.svg)](https://github.com/eendroroy/promptlib-zsh/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/eendroroy/promptlib-zsh.svg)](https://github.com/eendroroy/promptlib-zsh/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/eendroroy/promptlib-zsh.svg)](https://github.com/eendroroy/promptlib-zsh/pulls)
[![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/eendroroy/promptlib-zsh.svg)](https://github.com/eendroroy/promptlib-zsh/pulls?q=is%3Apr+is%3Aclosed)

Collection of libraries for zsh prompts

## Usage

add the library as a submodule:

    git submodule add https://github.com/eendroroy/promptlib-zsh.git libs/promptlib

use modules in your theme:

    THEME_ROOT=${0:A:h}
    MODULES=(git ssh python) # skip this line to include all modules
    source "${THEME_ROOT}/libs/promptlib/activate"
    
    # rest of your theme


## Available Modules

- background_job
- disk
- docker
- elixir
- git
- go
- java
- mercurial
- mysql
- node
- php
- postgres
- python
- ruby
- ssh
- subversion
- time
- vagrant

## Configurations

The library no longer formats data. You will have to make your own formatting.

## Contributing

Bug reports and pull requests are welcome on GitHub at [promptlib-zsh](https://github.com/eendroroy/promptlib-zsh) repository.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Author

* **indrajit** - *Owner* - [eendroroy](https://github.com/eendroroy)

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
