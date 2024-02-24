### zhsrc

## alias
# shell command
alias ls='ls -CF'
alias sl='ls -CF'
alias ll='ls -1'
alias lt='ls -1t'
alias la='ls -CFalh'
alias lls='tree -N -L 2'
alias lla='tree -a -h -N -L 2'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias sed='gsed'
alias diff='colordiff -u'
alias less='less -NR'
alias vi='nvim -u NONE'
alias vim='nvim'
alias vimdiff='nvim -d'
alias taginit='ctags -R -f .tags'
alias wl='wc -l'
alias fzf='fzf-tmux'
alias whihc='which'
# short alias
alias o='open .'
alias d='docker'
alias dc='docker-compose'
alias tf='terraform'
alias tg='terragrunt'
alias k='kubectl'
# git shortcut
alias gs='git status'
alias gd='git diff'
alias gl='git log --stat'
alias glo='git log --oneline'
alias glp='git log -p'
alias glm='git log -m --name-status'
alias gb='git branch'
alias gba='git branch -a'
alias gss='(){ if [ -n "${1}" ];then git stash push -u -m $1; else git stash push -u; fi }'
alias gsx='(){ TARGETSTASH=`git stash list|cut -d':' -f1|fzf`; if [ -z ${TARGETSTASH} ];then echo "DROP not done"; else git stash drop ${TARGETSTASH}; unset TARGETSTASH ;fi }'
alias gsl='git stash list'
alias gsd='git diff `git stash list|cut -d':' -f1|fzf`'
alias gsa='(){ TARGETSTASH=`git stash list|cut -d':' -f1|fzf`; if [ -z ${TARGETSTASH} ];then echo "APPLY not done"; else git stash apply ${TARGETSTASH}; unset TARGETSTASH ;fi }'
alias gco='(){ TARGETBRANCH=`git branch|sed "s/ *//g"|fzf`; if [ -n ${TARGETBRANCH} ]; then git checkout $TARGETBRANCH; unset TARGETBRANCH; fi }'
# gui application
alias vivaldi='open -a vivaldi'
# execute on filetype
alias -s html=vivaldi
alias -s md=vivaldi
alias -s vim='nvim -S'
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## additional sources
# zplug
source $HOME/.zplug/init.zsh
zplug "zsh-users/zsh-completions"
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load
# Completion source
if [ ! -d "${XDG_CONFIG_HOME}/zsh/completion" ];then
    mkdir -p "${XDG_CONFIG_HOME}/zsh/completion"
fi
if [ ! -e "${XDG_CONFIG_HOME}/zsh/completion/_docker" ];then
    cp ${HOME}/.ghq/github.com/naoki0xff/dotfiles/zsh/completion/docker.zsh-completion ${XDG_CONFIG_HOME}/zsh/completion/_docker
    cp ${HOME}/.ghq/github.com/naoki0xff/dotfiles/zsh/completion/docker-compose.zsh-completion ${XDG_CONFIG_HOME}/zsh/completion/_docker-compose
    cp ${HOME}/.ghq/github.com/naoki0xff/dotfiles/zsh/completion/docker-machine.zsh-completion ${XDG_CONFIG_HOME}/zsh/completion/_docker-machine
    cp ${HOME}/.ghq/github.com/naoki0xff/dotfiles/zsh/completion/kubectl.zsh-completion ${XDG_CONFIG_HOME}/zsh/completion/_kubectl
fi
fpath=($XDG_CONFIG_HOME/zsh/completion $fpath)

## zsh config general
# prompt
autoload -U promptinit
promptinit
PROMPT='%F{green}naoki@macos:%f%~%F{green}$%f'
# completion
autoload -Uz compinit && compinit -i
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
complete -C '/usr/local/bin/aws_completer' aws
# cd history
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 100
function fzf-cdr() {
  local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf --reverse)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-cdr
setopt noflowcontrol
bindkey '^y' fzf-cdr
