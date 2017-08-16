#enviroment variables
#browser
export BROWSER=/Applications/Vivaldi.app/Contents/MacOS/Vivaldi
#editor
export EDITOR=vim
alias vim='nvim'
#PATH
export PATH=$PATH:~/scripts/bin
alias hcd='cd ~/documents/help/'
alias pcd='cd ~/work/python/tutor/'

##language
#python
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
#ruby
eval "$(rbenv init -)"
