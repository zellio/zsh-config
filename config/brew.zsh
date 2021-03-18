#!/usr/bin/evn zsh

is_installed brew || return

# Aliases
alias htop="sudo htop"
alias mtr="sudo mtr"

# Guile
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
export GUILE_TLS_CERTIFICATE_DIRECTORY="/usr/local/etc/gnutls/"

# go
export GOPATH="${HOME}/.golang"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# groovy
export GROOVY_HOME="/usr/local/opt/groovy/libexec"

# Kegged programs
LDFLAGS="-Wl,-rpath,/usr/local/opt/llvm/lib"

_keg_programs=(
	'gnu-getopt' 'icu4c' 'libffi' 'libpq' 'llvm' 'ncurses' 'openjdk'
	'readline' 'sqlite' 'tcl-tk' 'zlib' 'openssl'
)

for program in "${_keg_programs[@]}"; do
	bin_path="/usr/local/opt/${program}/bin"
	ld_path="/usr/local/opt/${program}/lib"
	cpp_flags_path="/usr/local/opt/${program}/include"
	pkg_config_path="/usr/local/opt/${program}}/lib/pkgconfig"

	if [ -d "$bin_path" ]; then
		PATH="${bin_path}${PATH:+:}${PATH}"
	fi

	if [ -d "$ld_path" ]; then
		LDFLAGS="-L$ld_path${LDFLAGS:+ }${LDFLAGS}"
	fi

	if [ -d "$cpp_flags_path" ]; then
		CPPFLAGS="-I$cpp_flags_path${CPPFLAGS:+ }${CPPFLAGS}"
	fi

	if [ -d "$pkg_config_path" ]; then
		PKG_CONFIG_PATH="${pkg_config_path}${PKG_CONFIG_PATH:+:}${PKG_CONFIG_PATH}"
	fi
done

export PATH
export LDFLAGS
export CPPFLAGS
export PKG_CONFIG_PATH
