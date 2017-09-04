#!/usr/bin/env zsh

plib_venv(){
  if [[ -n "${VIRTUAL_ENV}" ]]; then
    __venv="(`basename \"$VIRTUAL_ENV\"`)"
    echo -n "${__venv}"
    unset __venv
  fi
}

plib_python_version(){
  which python > /dev/null && echo -ne `python --version 2>&1 | awk '{print $2}' | tr -d ' \n'`;
}

plib_python_major_version(){
  which python > /dev/null && echo -ne `python --version 2>&1 | awk -F '[. ]' '{print $2}' | tr -d '\n'`;
}

plib_python_major_minor_version(){
  which python > /dev/null && echo -ne `python --version 2>&1 | awk -F '[. ]' '{printf("%s.%s",$2,$3)}' | tr -d '\n'`;
}

plib_pyenv_version(){
  which pyenv > /dev/null && echo -ne `pyenv version | awk '{print $1}' | tr -d ' \n'`;
}

plib_pyenv_major_version(){
  which pyenv > /dev/null && echo -ne `pyenv version 2>&1 | awk -F '.' '/version/ {print $1}'`;
}

plib_pyenv_major_minor_version(){
  which pyenv > /dev/null && echo -ne `pyenv version 2>&1 | awk -F '.' '/version/ {printf("%s.%s",$1,$2)}'`;
}
