
is_ssh_shell() {
  [ -n "$SSH_CLIENT" -o -n "$SSH_CONNECTION" -o -n "$SSH_TTY" ] && echo "[ssh]"
}         

# export PROMPT='%B%F{033}[%F{081}%n%F{033}@%F{166}%m%F{033}:%F{147}%~ %F{033}%#]%f%b '

export PROMPT='%F{033}(%F{082}●%F{033}%f●%F{033}) %F{081}%n%F{033}@%F{166}%m%F{033}:%F{147}%~ %F{033}%#%f '%  
