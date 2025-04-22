function fish_greeting
end
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias delta='delta --side-by-side'
alias diff='delta'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias config-lazy='lazygit -git-dir=$HOME/dotfiles --work-tree=$HOME'
alias nv='fd --hidden --type f --exclude .git | fzf --reverse | xargs nvim'

alias dario='fastfetch'
