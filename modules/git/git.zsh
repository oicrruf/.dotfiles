# Git Aliases & Utilities
alias gclean="git branch --merged | grep -v '^\*' | xargs -n 1 git branch -d"
# (Oh My Zsh git plugin already provides many aliases)
