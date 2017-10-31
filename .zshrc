### zhsrc

# alias
# shell command
alias ls='ls -CF'
alias sl='ls -CF'
alias ll='ls -1'
alias lt='ls -1ta'
alias la='ls -CFal'
alias mv='mv -i'
alias cp='cp -i'
alias sed='gsed'
alias diff='colordiff -u'
alias less='less -N'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
# gui application
alias word='open -a microsoft\ word'
alias excel='open -a microsoft\ excel'
alias powerpoint='open -a microsoft\ powerpoint'
alias onenote='open -a microsoft\ onenote'
alias vivaldi='open -a vivaldi'
# cd shortcut
alias hcd='cd ~/documents/help/'
alias pcd='cd ~/work/tutor/pytutor/chapter/'
alias ccd='cd ~/project/dotfiles/'
alias dcd='cd ~/work/tutor/pydata/'
# git alias
alias gam='git add .;git commit -m "update"'
#iterm2_shell_integration:imgcat and else
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
