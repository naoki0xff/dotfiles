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
alias grep='grep --color=auto'
alias sed='gsed'
alias diff='colordiff -u'
alias less='less -N'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
alias wl='wc -l'
# gui application
alias word='open -a microsoft\ word'
alias excel='open -a microsoft\ excel'
alias powerpoint='open -a microsoft\ powerpoint'
alias onenote='open -a microsoft\ onenote'
alias vivaldi='open -a vivaldi'
# cd shortcut
alias ccd='cd ~/project/dotfiles/'
alias dcd='cd ~/works/tutor/pydata/'
alias hcd='cd ~/documents/gdoc/help/'
alias hhcd='cd ~/documents/gdoc/research/'
alias pcd='cd ~/works/tutor/pytutor/'
alias ucd='cd ~/onedrive/univ/'
# git alias
alias gam='git add .;git commit -m "update"'
#iterm2_shell_integration:imgcat and else
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
#function
function lls(){
	if [ -z $1 ];then
		ls *
	else
		ls $1/*
	fi
}
