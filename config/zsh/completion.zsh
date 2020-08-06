#!/usr/bin/env zsh

setopt always_last_prompt
setopt always_to_end
setopt auto_list
setopt auto_menu
setopt auto_name_dirs
setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash
setopt complete_aliases
setopt complete_in_word
setopt glob_complete
setopt hash_list_all
setopt list_ambiguous
setopt no_list_beep
setopt list_packed
setopt no_list_rows_first
setopt list_types
setopt no_menu_complete
# setopt rec_exact

zmodload -i zsh/complist

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
export LS_COLORS

zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' cache-path "${ZSH_HOME}/cache/"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

zstyle ':completion:*' verbose yes

zstyle ':completion:*:descriptions' format "%B———— %d ————%b"
zstyle ':completion:*:messages' format '%B%U———— %d ————%u%b'
zstyle ':completion:*:warnings' format "%B$fg[red]%}no match for: $fg[white]%d%b"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command 'ps --user "$USER" -ww -o pid,tty,args'

[ -r /etc/ssh/ssh_known_hosts ] &&
	_global_ssh_hosts=(
		$(ssh-keygen -l -f /etc/ssh/ssh_known_hosts 2>/dev/null |
				 awk '{sub(/,/, " ", $3); print $3}' )
	)

[ -r "${HOME}/.ssh/known_hosts" ] &&
	_ssh_hosts=(
		$(ssh-keygen -l -f "${HOME}/.ssh/known_hosts" |
				 awk '{sub(/,/, " ", $3); print $3}' )
	)

[ -r /etc/hosts ] &&
	_etc_hosts=(
		$(awk '!/^(#.*)?$/{print $1" "$2}' /etc/hosts)
	)

hosts=(
	"$_global_ssh_hosts[@]"
	"$_ssh_hosts[@]"
	"$_etc_hosts[@]"
	"$HOST"
	localhost
)

typeset -U hosts

zstyle ':completion:*:hosts' hosts $hosts

users=(
	# $(getent passwd | awk -F: '$3 >= 1000{print $1}')
	"$USER"
	root
)

typeset -U users

zstyle ':completion:*:*:*:users' users $users

zstyle '*' single-ignored show
