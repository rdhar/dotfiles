# --- prompt ---
# Sets __g to branch, short hash (detached HEAD) or worktree name; empty outside a repo.
__git() {
	__g=
	local out a
	out=$(git rev-parse --git-dir --abbrev-ref HEAD 2>/dev/null) || return
	mapfile -t a <<<"$out"
	__g=${a[1]}
	[[ $__g == HEAD ]] && __g=$(git rev-parse --short HEAD)
	[[ ${a[0]} == */worktrees/* ]] && __g+=" (wt:${a[0]##*/})"
}

__prompt() {
	local rc=$? dur= ex= col=32 t
	[[ -z $__t0 ]] && rc=0
	if [[ -n $__t0 ]]; then
		t=$(((${EPOCHREALTIME/[.,]/} - __t0) / 1000))
		if ((t < 1000)); then
			dur=${t}ms
		elif ((t < 60000)); then
			dur=$((t / 1000)).$((t % 1000 / 100))s
		else dur=$((t / 60000))m$((t / 1000 % 60))s; fi
		__t0=
	fi
	((rc)) && {
		col=31
		ex=" \[\e[31m\]✗$rc"
	}
	__git
	# Keep \${__g...} as text as bash expands it at display time, so a hostile branch name cannot run.
	PS1="\[\e[2m\]\t${dur:+ $dur}\[\e[0m\]$ex \[\e[34m\]\w\[\e[35m\]\${__g:+ \$__g}\[\e[0m\]\n\[\e[${col}m\]❯\[\e[0m\] "
}

PROMPT_DIRTRIM=3
PROMPT_COMMAND=(__prompt "${PROMPT_COMMAND[@]}")
# PS0 runs after Enter, before the command: stores start time in µs.
PS0+='${BASH:0:$((__t0=${EPOCHREALTIME/[.,]/},0))}'

# --- history and shell options ---
shopt -s histappend globstar
HISTCONTROL=ignoreboth:erasedups HISTSIZE=50000 HISTFILESIZE=50000
