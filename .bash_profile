#editor
export EDITOR=vim

#PATH
export PATH=$PATH:~/scripts/bin

##language config
#python config
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
export BROWSER=/Applications/Vivaldi.app/Contents/MacOS/Vivaldi
#ruby config
eval "$(rbenv init -)"
