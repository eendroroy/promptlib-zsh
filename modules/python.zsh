#!/usr/bin/env zsh

# default is regular 'python'

__python_executable_name() {
  if command -v python3 > /dev/null;
  then
      # if there is a 'python3', use that instead of 'python'
      # this is typical on macOS
      echo "python3"
  else
    echo "python"
  fi
}

plib_venv(){
  [[ -n "${VIRTUAL_ENV}" ]] && echo -n "($(basename "$VIRTUAL_ENV"))"
}

plib_python_version(){
  command -v $(__python_executable_name) > /dev/null && echo -ne "$($(__python_executable_name) --version 2>&1 | awk '{print $2}' | tr -d ' \n')"
}

plib_python_major_minor_version(){
  command -v $(__python_executable_name) > /dev/null && echo -ne "$($(__python_executable_name) --version 2>&1 | awk -F '[. ]' '{printf("%s.%s",$2,$3)}')"
}

plib_python_major_version(){
  command -v $(__python_executable_name) > /dev/null && echo -ne "$($(__python_executable_name) --version 2>&1 | awk -F '[. ]' '{print $2}')"
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
