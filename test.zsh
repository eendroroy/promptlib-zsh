#!/usr/bin/env zsh

source ${0:A:h}/modules.zsh

for module in ${MODULES}
do
  if [[ -f "${0:A:h}/modules/${module}.zsh" ]]
  then
    echo "${0:A:h}/modules/${module}.zsh"
    source "${0:A:h}/modules/${module}.zsh"
  else
    echo "module: '${module}' not found" >&2
  fi
done

echo
echo "  ==> git"
echo -ne "plib_is_git -> " && plib_is_git
echo
echo -ne "plib_git_branch -> " && plib_git_branch
echo
echo -ne "plib_git_rev -> " && plib_git_rev
echo

# Git staus / git dirty tests
echo "plib_git_status -> "
STATUS="$(plib_git_status)"
echo "${STATUS}"
echo
echo -ne "plib_git_staged_mod -> " && plib_git_staged_mod "${STATUS}"
echo
echo -ne "plib_git_unstaged_mod -> " && plib_git_unstaged_mod "${STATUS}"
echo
echo -ne "plib_git_staged_del -> " && plib_git_staged_del "${STATUS}"
echo
echo -ne "plib_git_unstaged_del -> " && plib_git_unstaged_del "${STATUS}"
echo
echo -ne "plib_git_staged_add -> " && plib_git_staged_add "${STATUS}"
echo
echo -ne "plib_git_unstaged_add -> " && plib_git_unstaged_add "${STATUS}"
echo
echo -ne "plib_git_status_new -> " && plib_git_status_new "${STATUS}"
echo
unset STATUS

echo -ne "plib_git_remote_is_defined -> " && plib_git_remote_is_defined remote
echo
echo -ne "plib_git_left_right -> " && plib_git_left_right
echo
echo -ne "plib_git_commit_since -> " && plib_git_commit_since
echo
echo -ne "plib_is_git_rebasing -> " && plib_is_git_rebasing
echo
echo -ne "plib_git_stash -> " && plib_git_stash
echo
echo
echo "  ==> mercurial"
echo -ne "plib_is_hg -> " && plib_is_hg
echo
echo -ne "plib_hg_branch -> " && plib_hg_branch
echo
echo -ne "plib_hg_rev -> " && plib_hg_rev
echo
echo
echo "  ==> subversion"
echo -ne "plib_is_svn -> " && plib_is_svn
echo
echo -ne "plib_svn_rev -> " && plib_svn_rev
echo
echo
echo "  ==> ssh"
echo -ne "plib_ssh_st -> " && plib_ssh_st
echo
echo -ne "plib_ssh_client_ip -> " && plib_ssh_client_ip
echo
echo -ne "plib_ssh_client_port -> " && plib_ssh_client_port
echo
echo
echo "  ==> python"
echo -ne "plib_venv -> " && plib_venv
echo
echo -ne "plib_python_version -> " && plib_python_version
echo
echo -ne "plib_python_major_minor_version -> " && plib_python_major_minor_version
echo
echo -ne "plib_python_major_version -> " && plib_python_major_version
echo
echo -ne "plib_pyenv_version -> " && plib_pyenv_version
echo
echo -ne "plib_pyenv_major_minor_version -> " && plib_pyenv_major_minor_version
echo
echo -ne "plib_pyenv_major_version -> " && plib_pyenv_major_version
echo
echo
echo "  ==> java"
echo -ne "plib_java_version -> " && plib_java_version
echo
echo -ne "plib_java_major_version -> " && plib_java_major_version
echo
echo
echo "  ==> ruby"
echo -ne "plib_ruby_version -> " && plib_ruby_version
echo
echo -ne "plib_ruby_major_minor_version -> " && plib_ruby_major_minor_version
echo
echo -ne "plib_ruby_major_version -> " && plib_ruby_major_version
echo
echo -ne "plib_rbenv_version -> " && plib_rbenv_version
echo
echo -ne "plib_rbenv_major_minor_version -> " && plib_rbenv_major_minor_version
echo
echo -ne "plib_rbenv_major_version -> " && plib_rbenv_major_version
echo
echo
echo "  ==> node"
echo -ne "plib_node_version -> " && plib_node_version
echo
echo -ne "plib_node_major_minor_version -> " && plib_node_major_minor_version
echo
echo -ne "plib_node_major_version -> " && plib_node_major_version
echo
echo -ne "plib_nodenv_version -> " && plib_nodenv_version
echo
echo -ne "plib_nodenv_major_minor_version -> " && plib_nodenv_major_minor_version
echo
echo -ne "plib_nodenv_major_version -> " && plib_nodenv_major_version
echo
echo
echo "  ==> elixir"
echo -ne "plib_elixir_version -> " && plib_elixir_version
echo
echo -ne "plib_elixir_major_minor_version -> " && plib_elixir_major_minor_version
echo
echo -ne "plib_elixir_major_version -> " && plib_elixir_major_version
echo
echo -ne "plib_exenv_version -> " && plib_exenv_version
echo
echo -ne "plib_exenv_major_minor_version -> " && plib_exenv_major_minor_version
echo
echo -ne "plib_exenv_major_version -> " && plib_exenv_major_version
echo
echo
echo "  ==> background_job"
echo -ne "plib_bg_count -> " && plib_bg_count
echo
echo
echo "  ==> disk"
echo -ne "plib_disk_name -> " && plib_disk_name
echo
echo -ne "plib_disk_size -> " && plib_disk_size
echo
echo -ne "plib_disk_avail -> " && plib_disk_avail
echo
echo -ne "plib_disk_used -> " && plib_disk_used
echo
echo -ne "plib_disk_cap -> " && plib_disk_cap
echo
echo
echo "  ==> time"
echo -ne "plib_time -> " && plib_time
echo
echo -ne "plib_date -> " && plib_date
echo
echo -ne "plib_day -> " && plib_day
echo
echo
echo
echo "  ==> go"
echo -ne "plib_go_version -> " && plib_go_version
echo
echo -ne "plib_go_major_minor_version -> " && plib_go_major_minor_version
echo
echo -ne "plib_go_major_version -> " && plib_go_major_version
echo
echo -ne "plib_goenv_version -> " && plib_goenv_version
echo
echo -ne "plib_goenv_major_minor_version -> " && plib_goenv_major_minor_version
echo
echo -ne "plib_goenv_major_version -> " && plib_goenv_major_version
echo
echo
echo
echo "  ==> crystal"
echo -ne "plib_crystal_version -> " && plib_crystal_version
echo
echo -ne "plib_crystal_major_minor_version -> " && plib_crystal_major_minor_version
echo
echo -ne "plib_crystal_major_version -> " && plib_crystal_major_version
echo
echo -ne "plib_crenv_version -> " && plib_crenv_version
echo
echo -ne "plib_crenv_major_minor_version -> " && plib_crenv_major_minor_version
echo
echo -ne "plib_crenv_major_version -> " && plib_crenv_major_version
echo
echo
echo "  ==> php"
echo -ne "plib_php_version -> " && plib_php_version
echo
echo -ne "plib_php_major_minor_version -> " && plib_php_major_minor_version
echo
echo -ne "plib_php_major_version -> " && plib_php_major_version
echo
echo
echo "  ==> docker"
echo -ne "plib_docker_version -> " && plib_docker_version
echo
echo -ne "plib_docker_major_minor_version -> " && plib_docker_major_minor_version
echo
echo -ne "plib_docker_major_version -> " && plib_docker_major_version
echo
echo -ne "plib_docker_service_status -> " && plib_docker_service_status
echo
echo -ne "plib_docker_container_count -> " && plib_docker_container_count
echo
echo
echo "  ==> vagrant"
echo -ne "plib_vagrant_version -> " && plib_vagrant_version
echo
echo -ne "plib_vagrant_major_minor_version -> " && plib_vagrant_major_minor_version
echo
echo -ne "plib_vagrant_major_version -> " && plib_vagrant_major_version
echo
echo
echo "  ==> mysql"
echo -ne "plib_mysql_version -> " && plib_mysql_version
echo
echo -ne "plib_mysql_major_minor_version -> " && plib_mysql_major_minor_version
echo
echo -ne "plib_mysql_major_version -> " && plib_mysql_major_version
echo
echo -ne "plib_mysql_service_status_homebrew -> " && plib_mysql_service_status_homebrew
echo
echo -ne "plib_mysql_service_status_linux -> " && plib_mysql_service_status_linux
echo
echo
echo "  ==> postgres"
echo -ne "plib_postgres_version -> " && plib_postgres_version
echo
echo -ne "plib_postgres_major_minor_version -> " && plib_postgres_major_minor_version
echo
echo -ne "plib_postgres_major_version -> " && plib_postgres_major_version
echo
echo -ne "plib_postgres_service_status_homebrew -> " && plib_postgres_service_status_homebrew
echo
echo -ne "plib_postgres_service_status_linux -> " && plib_postgres_service_status_linux
echo
