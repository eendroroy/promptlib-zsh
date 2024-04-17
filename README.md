# promptlib-zsh

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

## Contributing

Bug reports and pull requests are welcome on GitHub at [promptlib-zsh](https://github.com/eendroroy/promptlib-zsh) repository.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
