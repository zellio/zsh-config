

is_virtual_machine() {
    if [ -f /etc/.qemu_device ]; then
        return 0;
    fi 

    return 1;
}

is_ssh_shell() {
    if [ -n "$SSH_CLIENT" -o -n "$SSH_CONNECTION" -o -n "$SSH_TTY" ];then
        return 0;
    fi

    return 1;
}         


typeset -Ag T R S

case "$TERM" in
    xterm-256color | fbterm)
        T=( BINDER $FG[033] USER $FG[081] HOST $FG[166] PATH $FG[147] )
        R=( DEV $FG[082] STAGE $FG[226] PROD $FG[196] )
        S=( LCL "%f" SSH $FG[081] VRT $FG[201] ) 
      ;;
    *)
        T=( BINDER $FG[] USER $FG[] HOST $FG[] PATH $FG[] )
        R=( DEV $FG[] STAGE $FG[] PROD $FG[] )
        S=( LCL "%f" SSH $FG[] VRT $FG[] ) 
      ;;
esac


PROMPT='$T[BINDER]('

case "$BOX_RISK_LEVEL" in
    2)
        PROMPT="$PROMPT$R[DEV]"
        ;;
    1)
        PROMPT="$PROMPT$R[STAGE]"
        ;;
    0)
        PROMPT="$PROMPT$R[PROD]"
        ;;
    *)
        PROMPT="$PROMPT%f"
        ;;
esac
PROMPT="$PROMPT●"


if is_virtual_machine; then
    PROMPT="$PROMPT$S[VRT]"
elif is_ssh_shell; then
    PROMPT="$PROMPT$S[SSH]"
else
    PROMPT="$PROMPT$S[LCL]"
fi
PROMPT="$PROMPT●"


PROMPT="$PROMPT$T[BINDER]) $T[USER]%n$T[BINDER]@$T[HOST]%m$T[BINDER]:$T[PATH]%~ $T[BINDER]%#%f "
export PROMPT

return 0
