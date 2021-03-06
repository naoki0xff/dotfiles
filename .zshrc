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
alias cgrep='grep --color=always'
alias ag='ag -a --color --group'
alias agf='ag -a -g'
alias agh='ag -a -l'
alias sed='gsed'
alias diff='colordiff -u'
alias less='less -NR'
alias e='nvim'
alias vi='nvim -u NONE'
alias vim='nvim'
alias vimv='nvim'
alias vimdiff='nvim -d'
alias taginit='ctags -R -f .tags'
alias wl='wc -l'
alias fzf='fzf-tmux'
alias vcat='(){ if [ -n "${1}" ];then cat $1|sed "s/,/ ,/g"|column -t -s,|less -S; else echo "please specify csv file"; fi }'
alias rfcid='(){ ID=`cat ~/usr/doc/ref/rfc-index.txt|fzf`; if [ -z ${ID} ]; then return 1 ; else echo ${ID}; unset ID ; fi }'
alias gcd='(){ SRCLOC=`ghq list|fzf`; if [ -z ${SRCLOC} ] ; then return 1; else cd ~/.ghq/${SRCLOC}; unset SRCLOC ; fi }'
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
alias gsr='(){ TARGETSTASH=`git stash list|cut -d':' -f1|fzf`; if [ -z ${TARGETSTASH} ];then echo "APPLY REVESE not done"; else git stash show ${TARGETSTASH} -p|git apply --reverse; unset TARGETSTASH ;fi }'
alias gco='(){ TARGETBRANCH=`git branch|sed "s/ *//g"|fzf`; if [ -n ${TARGETBRANCH} ]; then git checkout $TARGETBRANCH; unset TARGETBRANCH; fi }'
# gui application
alias word='open -a microsoft\ word'
alias excel='open -a microsoft\ excel'
alias powerpoint='open -a microsoft\ powerpoint'
alias onenote='open -a microsoft\ onenote'
alias vivaldi='open -a vivaldi'
alias chrome='open -a google\ chrome'
alias code='/Applications/Visual\ Studio\ Code.app/contents/Resources/app/bin/code'
# cd shortcut
alias ccd='cd ~/.ghq/github.com/naoki0xff/dotfiles/'
alias dcd='cd ~/works/tutor/pydata/'
alias hcd='cd ~/Google\ Drive/documents/help/'
alias pcd='cd ~/works/tutor/phptutor/'
alias rcd='cd ~/works/tutor/rbtutor/'
alias cds='() { target_path=`cat ~/usr/doc/share/shell/cd_path.dat|fzf`; if [ -z ${target_path} ]; then :;else cd ${target_path};fi }'
# execute on filetype
alias -s html=vivaldi
alias -s md=vivaldi
alias -s vim='nvim -S'
alias -s exe=mono
# iterm2_shell_integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
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
# Docker for Mac
if [ ! -d "${XDG_CONFIG_HOME}/zsh/completion" ];then
    mkdir -p "${XDG_CONFIG_HOME}/zsh/completion"
fi
if [ ! -e "${XDG_CONFIG_HOME}/zsh/completion/_docker" ];then
    cp ${HOME}/.ghq/github.com/naoki0xff/dotfiles/zsh/completion/docker.zsh-completion ${XDG_CONFIG_HOME}/zsh/completion/_docker
    cp ${HOME}/.ghq/github.com/naoki0xff/dotfiles/zsh/completion/docker-compose.zsh-completion ${XDG_CONFIG_HOME}/zsh/completion/_docker-compose
    cp ${HOME}/.ghq/github.com/naoki0xff/dotfiles/zsh/completion/docker-machine.zsh-completion ${XDG_CONFIG_HOME}/zsh/completion/_docker-machine
fi
fpath=($XDG_CONFIG_HOME/zsh/completion $fpath)

## finally
autoload -Uz compinit && compinit -i
