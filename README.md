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
- crystal
- disk
- docker
- elixir
- git
- go
- gradle
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


## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
