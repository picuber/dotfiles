# auto-run in background
function zat {
	zathura "$@" &!
}
function feh {
	/usr/bin/feh "$@" &!
}
function xournal {
	xournalpp "$@" &!
}
function libreoffice {
	/usr/bin/libreoffice "$@" &!
}

# open <today>.txt in nvim
function today {
	nvim `date "+%Y-%m-%d"`.txt
}

################
## manual AUR ##
################

# clone
function aurc {
	git clone "https://aur.archlinux.org/${1:?"Please specify an AUR package name"}.git" "$HOME/Downloads/Installer/AUR/$1"
	echo "[\e[0;32m$pkg:t\e[0m] Cloned"
}

# install
function auri {
	aurc "${1:?"Please specify an AUR package name"}"
	echo "[\e[0;32m$pkg:t\e[0m] Installing"
	cd "$HOME/Downloads/Installer/AUR/$1" && makepkg -cris
}

# update
function auru {
	for pkg in $HOME/Downloads/Installer/AUR/*(/); do
		if [ "`cd $pkg && git pull`" = "Already up to date." ]; then
			echo "[\e[0;32m$pkg:t\e[0m] Already up to date"
		else
			echo "[\e[1;33m$pkg:t\e[0m] Updating..."
			cd $pkg && makepkg -cris
		fi
	done
}

# delete
function aurd {
	yes | rm -r "$HOME/Downloads/Installer/AUR/${1:?"Please specify an AUR package name"}"
	echo "[\e[0;31m$pkg:t\e[0m] Deleted"
	cd $HOME/Downloads/Installer/AUR
}

