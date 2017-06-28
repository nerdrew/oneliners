#compdef git-fresh git-find-reviewers git-meta-diff git-purge-merged-branches -p git

_git_oneliners() {
  if [[ ${words[1]} == "git" ]]; then
    curr=${words[2]}
    last=2
  else
    curr=${words[1]#git-}
    last=1
  fi
  if [[ $curr == "fresh" ]]; then
    _arguments \
      "$last: :__git_oneliners_branches"
    _compskip=all
  elif [[ $curr == "meta-diff" ]]; then
    _arguments \
      "$last: :__git_oneliners_branches" \
      "$((last + 1)): :__git_oneliners_branches"
    _compskip=all
  elif [[ $curr == "purge-merged-branches" ]]; then
    _arguments \
      '--remote[purge merged remote branches]' \
      '--tags[purge remote tags]' \
      "$last: :__git_oneliners_branches"
    _compskip=all
  elif [[ $curr == "find-reviewers" ]]; then
    _arguments -s -S \
      '(-v --verbose)'{-v,--verbose}'[Print line count by file]' \
      '(-l --log)'{-l,--log}'[Include git log output]' \
      '(-c --color)'{-c,--color}'[Colorize output (default: true)]' \
      '(-d --debug)'{-d,--debug}'[Print debug information]' \
      "$last: :__git_oneliners_branches"
    _compskip=all
  fi
}

__git_oneliners_branches() {
  local -a branches;
  branches=(HEAD $(git for-each-ref --format="%(refname:short)" "refs/heads/" "refs/remotes/"))
  _describe 'command' branches
}

_git_oneliners
