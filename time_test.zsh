#!/usr/bin/env zsh

source ${0:A:h}/modules.zsh

for module in ${MODULES}
do
  if [[ -f "${0:A:h}/modules/${module}.zsh" ]]
  then
    source "${0:A:h}/modules/${module}.zsh"
  fi
done

plib_is_git > /dev/null
plib_git_branch > /dev/null
plib_git_rev > /dev/null
plib_git_dirty > /dev/null
plib_git_left_right > /dev/null
plib_git_commit_since > /dev/null
plib_is_git_rebasing > /dev/null
plib_is_hg > /dev/null
plib_hg_branch > /dev/null
plib_hg_rev > /dev/null
plib_is_svn > /dev/null
plib_svn_rev > /dev/null
plib_ssh_st > /dev/null
plib_ssh_client_ip > /dev/null
plib_ssh_client_port > /dev/null
plib_venv > /dev/null
plib_python_version > /dev/null
plib_python_major_version > /dev/null
plib_pyenv_version > /dev/null
plib_pyenv_major_version > /dev/null
plib_python_major_minor_version > /dev/null
plib_pyenv_major_minor_version > /dev/null
plib_java_version > /dev/null
plib_java_major_version > /dev/null
plib_ruby_version > /dev/null
plib_rbenv_version > /dev/null
plib_ruby_short_version > /dev/null
plib_node_version > /dev/null
plib_nodenv_version > /dev/null
plib_node_major_version > /dev/null
plib_nodenv_major_version > /dev/null
plib_elixir_version > /dev/null
plib_exenv_version > /dev/null
plib_bg_count > /dev/null
plib_disk_name > /dev/null
plib_disk_size > /dev/null
plib_disk_avail > /dev/null
plib_disk_used > /dev/null
plib_disk_cap > /dev/null
plib_time > /dev/null
plib_date > /dev/null
plib_day > /dev/null
plib_go_version > /dev/null
plib_goenv_version > /dev/null
plib_crystal_version > /dev/null
plib_crenv_version > /dev/null
plib_php_version > /dev/null