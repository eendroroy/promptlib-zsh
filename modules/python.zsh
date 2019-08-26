#!/usr/bin/env zsh

plib_venv(){
  [[ -n "${VIRTUAL_ENV}" ]] && echo -n "($(basename "$VIRTUAL_ENV"))"
}

plib_python_version(){
  command -v python > /dev/null && echo -ne "$(python --version 2>&1 | awk '{print $2}' | tr -d ' \n')"
}

plib_python_major_minor_version(){
  command -v python > /dev/null && echo -ne "$(python --version 2>&1 | awk -F '[. ]' '{printf("%s.%s",$2,$3)}')"
}

plib_python_major_version(){
  command -v python > /dev/null && echo -ne "$(python --version 2>&1 | awk -F '[. ]' '{print $2}')"
}

plib_pyenv_version(){
  command -v pyenv > /dev/null && echo -ne "$(pyenv version-name | awk '{print $1}')"
}

plib_pyenv_major_minor_version(){
  command -v pyenv > /dev/null && echo -ne "$(pyenv version-name | awk -F '.' '{printf("%s.%s",$1,$2)}')"
}

plib_pyenv_major_version(){
  command -v pyenv > /dev/null && echo -ne "$(pyenv version-name | awk -F '.' '{print $1}')"
}
