
is_ssh_shell() {
  [ -n "$SSH_CLIENT" -o -n "$SSH_CONNECTION" -o -n "$SSH_TTY" ] && echo "[ssh]"
}         

# export PROMPT='%B%F{033}[%F{081}%n%F{033}@%F{166}%m%F{033}:%F{147}%~ %F{033}%#]%f%b '




case "$TERM" in
xterm-256color | fbterm)
  export PROMPT='%F{033}(%F{082}●%F{033}%f●%F{033}) %F{081}%n%F{033}@%F{166}%m%F{033}:%F{147}%~ %F{033}%#%f '%  
  ;;
xterm-color)
  export PROMPT='%B%F{004}(%F{002}●%F{008}%f●%F{004}) %F{006}%n%F{004}@%F{003}%m%F{004}:%F{005}%~ %F{004}%#%f%b '%  
  ;;
*)
  export PROMPT='%n at %m in %~ >%b '%  
esac
