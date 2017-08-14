promptlib-zsh
===============

collection of libraries for zsh prompts

usage
-----

add the library as a submodule:

    git submodule add https://github.com/eendroroy/promptlib-zsh.git libs/promptlib

use modules in your theme:

    THEME_ROOT=${0:A:h}
    MODULES=(git ssh python) # skip this line to include all modules
    source "${THEME_ROOT}/libs/promptlib/activate"
    
    # rest of your theme


available modules
-----------------

- background jobs
- disk
- git
- java
- mercurial
- node
- python
- ruby
- ssh
- subversion

