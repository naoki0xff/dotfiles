#enviroment variables
#editor
export EDITOR=vim
#PATH
export PATH=$PATH:~/scripts/bin

##language config
#python
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
export BROWSER=/Applications/Vivaldi.app/Contents/MacOS/Vivaldi
#ruby
eval "$(rbenv init -)"
