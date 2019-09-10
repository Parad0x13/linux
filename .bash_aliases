alias c='clear'
alias la='ls -la'
alias cd..='cd ..'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias mist='~/Desktop/mist/mist.sh'
alias dush='du -sh'
# Opens my favorite default tmux session
alias gogogo='tmux new-session \; split-window -h \; selectp -t 0 \; split-window -v \; selectp -t 1 \; split-window -h \; selectp -t 0'

customFunctions=()

customFunctions+=(f)
# Just a nice macro is all : 3
f() {
	if [ $# -eq 1 ]; then
		find ./ -name "*$1*" 2>/dev/null
	fi
}

customFunctions+=(h)
# I hate having to type all of hexdump stuff out all the time
h() {
	if [ $# -eq 1 ]; then
		hexdump -C "$1" | less
	fi
}

customFunctions+=(halp)
halp() {
	echo "find something"
	echo "    find / -name 'something'"

	echo
	echo "tmux (gogogo)"
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

introduction=""
for function in "${customFunctions[@]}"
do
	introduction+="$function "
done
introduction=`echo $introduction`
echo "Linux Environment v1.7 [$introduction]"
