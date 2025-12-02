set -U fish_greeting ""
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

source ~/.bash_profile

fish_config theme dump > ~/.config/fish/themes/tokyonight_night.theme

set -gx EDITOR nvim
set -Ux fish_user_paths $HOME/.local/bin $fish_user_paths

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias delta='delta --side-by-side'
alias diff='delta'

alias lg='lazygit'
alias please='sudo'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias config-lazy='lazygit -git-dir=$HOME/dotfiles --work-tree=$HOME'

alias nv='fd --hidden --type f --exclude .git | fzf --reverse | xargs nvim'
alias c='cd $(find * -type d | fzf)'
alias cc='cd $(find . -type d | fzf)'


alias dario='/bin/fastfetch'
alias fastfetch='fastfetch --logo small'

zoxide init fish | source
