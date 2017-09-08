#enviroment variable
#browser
export BROWSER=/Applications/Vivaldi.app/Contents/MacOS/Vivaldi
#editor
export EDITOR=nvim
export XDG_CONFIG_HOME=~/.config
export VBACKUPDIR=~/.local/share/nvim/backup
#PATH
export PATH=$PATH:~/scripts/bin

##language
#python
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
#ruby
eval "$(rbenv init -)"
