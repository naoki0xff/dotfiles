#enviroment variables
#browser
export BROWSER=/Applications/Vivaldi.app/Contents/MacOS/Vivaldi
#vim
export EDITOR=vim
alias vim='nvim'
export XDG_CONFIG_HOME=~/.config
#PATH
export PATH=$PATH:~/scripts/bin

##language
#python
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
#ruby
eval "$(rbenv init -)"
