#compdef cargo-open -p cargo

_cargo_open() {
  curr=$words[(( $CURRENT - 1 ))]
  if [[ $curr == "open" || $curr == "cargo-open" ]]; then
    _arguments '*: :__crates'
    _compskip=all
  fi
}

__crates() {
  local -a crates;
  crates=(${(u)$(cargo metadata | jq -r ".packages[].name")})

  _describe 'command' crates
}

_cargo_open
