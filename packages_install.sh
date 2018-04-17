#!/bin/bash

# [TODO] Review/prioritize install size/duration
# [TODO] Add explainations for each entry
# [TODO] Don't have it install if the package is already installed

# [INFO]
# apt list --installed
# apt-cache search .

printf "Package Installer v1.1\n\n"

packages=()

for arg in "$@"
do
	if [ "$arg" == "--help" ]; then
		displayHelp=1
	fi

	if [ "$arg" == "--all" ]; then
		all=1
	fi

	if [ "$arg" == "-u" ]; then
		utility=1
	fi

	if [ "$arg" == "-m" ]; then
		media=1
	fi

	if [ "$arg" == "-e" ]; then
		environment=1
	fi

	if [ "$arg" == "-g" ]; then
		gaming=1
	fi

	if [ "$arg" == "-d" ]; then
		development=1
	fi

	if [ "$arg" == "-n" ]; then
		networking=1
	fi

	if [ "$arg" == "-r" ]; then
		re=1
	fi

	if [ "$arg" == "-a" ]; then
		mathematics=1
	fi

	if [ "$arg" == "-i" ]; then
		interesting=1
	fi
done

if [ "$displayHelp" == 1 ]; then
	echo Help WIP
fi

# Mandatory
packages+=(git)
packages+=(p7zip-full)
packages+=(vim)

packages+=(lynx)
packages+=(tmux)

packages+=(python)

# Utility
if [ "$utility" == 1 ] || [ "$all" == 1 ]; then
	packages+=(ddir)
	packages+=(tree)

	packages+=(gzip)
	packages+=(shc)
	packages+=(uuid)
	packages+=(vim-addon-manager)
	packages+=(wipe)
	packages+=(youtube-dl)
	packages+=(yum)
fi

# Media
if [ "$media" == 1 ] || [ "$all" == 1 ]; then
	packages+=(blender)
	packages+=(ffmpeg)
	packages+=(gimp)
	packages+=(pngcrush)
	packages+=(png23d)
	packages+=(png2html)
	packages+=(slic3r)
fi

# Environment
if [ "$environment" == 1 ] || [ "$all" == 1 ]; then
	#packages+=(chromium-browser)
	packages+=(docker)
	#packages+=(firefox)
	packages+=(sic)
	packages+=(vlc)
fi

# Gaming
if [ "$gaming" == 1 ] || [ "$all" == 1 ]; then
	packages+=(crafty)
	packages+=(steam)
fi

# Development
if [ "$development" == 1 ] || [ "$all" == 1 ]; then
	packages+=(make)

	packages+=(clang)
	packages+=(clang-format-4.0)
	packages+=(clang-modernize-3.7)
	packages+=(clang-tidy-4.0)

	packages+=(g++)
	packages+=(gcc)
	packages+=(gdb)

	packages+=(nasm)

	packages+=(lldb)

	packages+=(pep8)
	packages+=(pylint)
	packages+=(tidy)

	#packages+=(codeblocks)
	packages+=(eclipse)
	packages+=(npm)

	packages+=(valgrind)
fi

# Networking
if [ "$networking" == 1 ] || [ "$all" == 1 ]; then
	packages+=(curl)
	packages+=(iog)
	packages+=(mz)
	packages+=(netcat)
	packages+=(nmap)
	packages+=(putty)
	packages+=(putty-tools)
	packages+=(tcpdump)
	packages+=(wireshark)
	packages+=(zenmap)
fi

# Reverse Engineering
if [ "$re" == 1 ] || [ "$all" == 1 ]; then
	packages+=(fcrackzip)
	packages+=(fuzz)
	packages+=(ophcrack)
	packages+=(pdfcrack)
fi

# Mathematics
if [ "$mathematics" == 1 ] || [ "$all" == 1 ]; then
	packages+=(epix)
	packages+=(euler)
	packages+=(gvb)
	packages+=(mona)
	packages+=(octave)
	packages+=(xgraph)
	packages+=(xoscope)
fi

# Simply Interesting
if [ "$interesting" == 1 ] || [ "$all" == 1 ]; then
	packages+=(cmatrix)
	packages+=(cw)
	packages+=(cwcp)
	packages+=(lios)
	packages+=(lolcat)
	packages+=(sl)
	packages+=(wmcube)
	packages+=(xjokes)
fi

# Install all the things!!!
TIMEFORMAT=%Rs
for package in "${packages[@]}"
do
	printf "Processing %s\n" $package
	time yes | sudo apt-get install $package > /dev/null
	echo
done

echo Processing apt-get updates

# Final
yes | sudo apt-get update  > /dev/null
yes | sudo apt-get dist-upgrade  > /dev/null

echo Consider grabbing Chrome and installing with dpkg -i package.deb
