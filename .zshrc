### zhsrc

# alias
# shell command
alias ls='ls -CF'
alias sl='ls -CF'
alias ll='ls -1'
alias lt='ls -1tA'
alias la='ls -CFal'
alias lls='tree -N -L 2'
alias lla='tree -a -N -L 2'
alias mv='mv -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias sed='gsed'
alias diff='colordiff -u'
alias less='less -N'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
alias ptags='/usr/local/Cellar/ctags/5.8_1/bin/ctags -R -f .tags'
alias wl='wc -l'
alias fzf='fzf-tmux'
# git shortcut
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline'
alias gb='git branch --list'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gss='(){ if [ -n "${1}" ];then git stash push -u -m $1; else git stash push -u; fi }'
alias gsx='(){ TARGETSTASH=`git stash list|cut -d':' -f1|fzf`; if [ -z ${TARGETSTASH} ];then echo "DROP not done"; else git stash drop ${TARGETSTASH}; unset TARGETSTASH ;fi }'
alias gsl='git stash list'
alias gsd='git diff `git stash list|cut -d':' -f1|fzf`'
alias gsa='(){ TARGETSTASH=`git stash list|cut -d':' -f1|fzf`; if [ -z ${TARGETSTASH} ];then echo "APPLY not done"; else git stash apply ${TARGETSTASH}; unset TARGETSTASH ;fi }'
alias gsr='(){ TARGETSTASH=`git stash list|cut -d':' -f1|fzf`; if [ -z ${TARGETSTASH} ];then echo "APPLY REVESE not done"; else git stash show ${TARGETSTASH} -p|git apply --reverse; unset TARGETSTASH ;fi }'
alias gv='grv'
# gui application
alias word='open -a microsoft\ word'
alias excel='open -a microsoft\ excel'
alias powerpoint='open -a microsoft\ powerpoint'
alias onenote='open -a microsoft\ onenote'
alias vivaldi='open -a vivaldi'
alias chrome='open -a google\ chrome'
alias code='/Applications/Visual\ Studio\ Code.app/contents/Resources/app/bin/code'
# cd shortcut
alias ccd='cd ~/usr/src/dotfiles/'
alias dcd='cd ~/works/tutor/pydata/'
alias hcd='cd ~/Google\ Drive/documents/help/'
alias pcd='cd ~/works/tutor/phptutor/'
# execute on filetype
alias -s html=vivaldi
alias -s md=vivaldi
alias -s vim='nvim -S'
#iterm2_shell_integration:imgcat and else
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
