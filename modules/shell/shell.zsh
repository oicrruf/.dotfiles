# Shell Productivity Tools
alias agy="/Applications/Antigravity.app/Contents/Resources/app/bin/antigravity"
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias lt2='eza --tree --level=2 --icons'
alias lg='eza -la --icons --git --git-repos'
alias cat='bat'
alias rcat='/bin/cat'
alias df='duf'
alias top='btop'
alias help='tldr'

# Plugins & Interactive tools
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(direnv hook zsh)"

bindkey '^[[1;3C' forward-word
bindkey '^ ' autosuggest-accept

curlj() { curl -s "$@" | jq; }
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias tree='eza --tree --icons'

# Ollama local AI
alias oll='ollama run qwen2.5-coder:7b'
