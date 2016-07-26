#compdef git-fresh

typeset -A opt_args

function _git-fresh() {
  _arguments '*: :__git_branches'
}

__git_branches() {
  local -a branches;
  branches=(${${$(git branch -a)#remotes/}#\*})

  _describe 'command' branches
}

_git-fresh
