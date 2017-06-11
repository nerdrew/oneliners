#compdef cargo-open -p cargo

_cargo_open() {
  if [[ ${words[1]} == "cargo" ]]; then
    curr=${words[2]}
    last=2
  else
    curr=${words[1]#cargo-}
    last=1
  fi
  if [[ $curr == "open" ]]; then
    _arguments "$last: :__crates"
    _compskip=all
  fi
}

__crates() {
  local -a crates;
  crates=($(cargo metadata --format-version=1 | jq -r ".packages[].name" | sort -u))
  _describe 'command' crates
}

_cargo_open
