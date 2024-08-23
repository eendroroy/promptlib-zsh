#!/usr/bin/env zsh

# default is regular 'python'
_PYTHON=python;
if ! command -v python > /dev/null && command -v python3 > /dev/null;
then
    # if there *not* a 'python' but there *is* a 'python3', use that instead
    # this is typical on macOS
    _PYTHON=python3;
fi

plib_venv(){
  [[ -n "${VIRTUAL_ENV}" ]] && echo -n "($(basename "$VIRTUAL_ENV"))"
}

plib_python_version(){
  command -v $_PYTHON > /dev/null && echo -ne "$("$_PYTHON" --version 2>&1 | awk '{print $2}' | tr -d ' \n')"
}

plib_python_major_minor_version(){
  command -v "$_PYTHON" > /dev/null && echo -ne "$("$_PYTHON" --version 2>&1 | awk -F '[. ]' '{printf("%s.%s",$2,$3)}')"
}

plib_python_major_version(){
  command -v "$_PYTHON" > /dev/null && echo -ne "$("$_PYTHON" --version 2>&1 | awk -F '[. ]' '{print $2}')"
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
