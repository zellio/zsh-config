

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
    xterm-256color | fbterm | screen-256color)
        T=( BINDER %F{033} USER %F{081} HOST %F{166} PATH %F{147} GIT %F{124} )
        R=( DEV %F{040} STAGE %F{226} PROD %F{196} )
        S=( LCL %f SSH %F{081} VRT %F{201} )
      ;;
    *)
        T=( BINDER %B%F{004} USER %B%F{006} HOST %F{005} PATH %F{002} )
        R=( DEV %F{002} STAGE %B%F{003} PROD %B%F{001} )
        S=( LCL %f SSH %F{006} VRT %F{005} )
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

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "$R[DEV]■%f"
zstyle ':vcs_info:git:*' unstagedstr "$R[STAGE]■%f"
zstyle ':vcs_info:git:*' formats "$T[BINDER][$T[HOST]±$T[BINDER] %c%u$T[HOST]$T[GIT]%b%m$T[BINDER]]%f "
zstyle ':vcs_info:git:*' actionformats "$T[BINDER][$T[HOST]±$T[BINDER] %c%u$T[HOST]$T[GIT]%b$T[BINDER]:$T[GIT]%a$T[BINDER]]%f "
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-status-cleanup git-remote-status

function +vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[unstaged]+="$R[PROD]■%f"
    fi
}

function +vi-git-status-cleanup() {
    if [ -n "$hook_com[unstaged]" ]; then
        hook_com[unstaged]+=' '
    elif [ -n "$hook_com[staged]" ]; then
        hook_com[staged]+=' '
    fi
}

function +vi-git-remote-status() {
    local ahead behind
    local -a gitstatus

    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    (( $ahead )) && gitstatus+=( "+${ahead}" ) # ►

    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    (( $behind )) && gitstatus+=( "-${behind}" ) # ◄

    (( $#gitstatus )) && hook_com[misc]+=" $R[DEV]${(pj:/:)gitstatus}%f" # \x3a
}

function precmd() {
    vcs_info
}

PROMPT="$PROMPT$T[BINDER]) $T[USER]%n$T[BINDER]@$T[HOST]%m$T[BINDER]:$T[PATH]%~ "
PROMPT="$PROMPT\${vcs_info_msg_0_}$T[BINDER]%#%f%b "
export PROMPT

return 0
