_cops() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$(find ~/.cops_passwords/ -maxdepth 1 -type d -printf "%f ")" -- $cur) )
}

complete -F _cops cops
complete -F _cops copsi
complete -F _cops copsx
complete -F _cops copsx2
