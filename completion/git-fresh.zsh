#compdef git-fresh -p git

_git_fresh() {
  curr=$words[(( $CURRENT - 1 ))]
  if [[ $curr == "fresh" || $curr == "git-fresh" ]]; then
    _arguments '*: :__git_branches'
    _compskip=all
  fi
}

__git_branches() {
  local -a branches;
  branches=($(git for-each-ref --format="%(refname:short)" "refs/remotes/"))

  _describe 'command' branches
}

_git_fresh
