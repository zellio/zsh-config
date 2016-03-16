#!/usr/bin/env zsh

is_installed etckeeper || return

function etckeeper_wrapper
{
	local cmd="$1";shift
	sudo etckeeper pre-install
	sudo "$cmd" "$@"
	sudo etckeeper post-install
}

package_managers=(
	pacman yaourt
	apt-get apt
	rpm yum dnf
)

for cmd in "${package_managers[@]}"; do
	is_installed "$cmd" &&
		alias "$cmd"="etckeeper_wrapper '$cmd'"
done
