# function to return current branch name while suppressing errors
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo ''$branch' '
    fi
}

alias cat="bat"
alias ls="exa"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias s.="subl ."
alias v="nvim"
alias v.="nvim ."
alias server="script/server"
alias tests="script/tests"
alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias go="git checkout "
alias gull="git pull"
alias gush="git push"
alias hist="git lg"
alias gfp="git fetch --prune"
alias yd="yarn dev"
alias be="bundle exec"
alias where-localhost="ifconfig | grep 'inet ' | grep -v 127.0.0.1"

setopt prompt_subst # allow command substitution inside the prompt
setopt menucomplete

zstyle ":completion:*" menu select=1 _complete _ignored _approximate

PROMPT='%F{cyan}%c %B$(git_branch)%b%f' # set the prompt value

export EDITOR="nvim"
export LANG=en_US.UTF-8 # copy cyrillic text in vim
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

autoload -U colors && colors
autoload -Uz compinit && compinit

eval "$(rbenv init -)"
