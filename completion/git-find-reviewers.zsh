#compdef git-find-reviewers -p git

_git_find_reviewers() {
  curr=$words[(( $CURRENT - 1 ))]
  if [[ $curr == "find-reviewers" || $curr == "git-find-reviewers" ]]; then
    _arguments -s -S \
      "-v[Print line count by file]" \
      "--verbose[Print line count by file]" \
      "--no-verbose[Print line count by file]" \
      "-l[Include git log output]" \
      "--log[Include git log output]" \
      "--no-log[Include git log output]" \
      "-c[Colorize output (default: true)]" \
      "--color[Colorize output (default: true)]" \
      "--no-color[Colorize output (default: true)]" \
      "-d[Print debug information]" \
      "--debug[Print debug information]" \
      "--no-debug[Print debug information]" \
      '*:file:_files'
    _compskip=all
  fi
}

_git_find_reviewers
