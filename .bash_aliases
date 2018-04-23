alias c='clear'
alias la='ls -la'
alias cd..='cd ..'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias mist='~/Desktop/mist/mist.sh'

customFunctions=()

customFunctions+=(f)
# Just a nice macro is all : 3
f() {
	if [ $# -eq 1 ]; then
		find ./ -name "*$1*" 2>/dev/null
	fi
}

customFunctions+=(halp)
halp() {
	echo find something
	echo "    find / -name 'something'"

	echo
	echo tmux
	echo "    ctrl+a"
	echo "    | -"
	echo "    z = zoom"
	echo "    d = detach, aka close out of all tmux"
}

# Simply strip all symbols from a binary
customFunctions+=(strippystrip)
strippystrip() {
	a=$(stat --printf="%s" $1)
	strip --strip-debug --strip-unneeded $1
	b=$(stat --printf="%s" $1)
	let delta=$a-$b
	echo Was able to strip $delta bytes from $1
}

customFunctions+=(tmux-dev)
tmux-dev() {
	tmux new-session -d
	tmux split-window -h
	tmux selectp -t 0
	tmux split-window -v 'top'
	tmux split-window -h 'dmesg -wH'
	tmux selectp -t 0
	tmux -2 attach-session -d
}

# Opens my favorite default tmux session
customFunctions+=(gogogo)
gogogo() {
	tmux new-session -d
	tmux split-window -h
	tmux selectp -t 0
	tmux split-window -v
	tmux selectp -t 1
	tmux split-window -h
	tmux selectp -t 0
	tmux -2 attach-session -d
}

introduction=""
for function in "${customFunctions[@]}"
do
	introduction+="$function "
done
introduction=`echo $introduction`
echo "Linux Environment v1.6 [$introduction]"

