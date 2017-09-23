### bash_profile

## ENVIRONMENT
# VAR
export BROWSER=/Applications/Vivaldi.app/Contents/MacOS/Vivaldi
export EDITOR=nvim
export MANPAGER="nvim -c 'set ft=man' -"
export XDG_CONFIG_HOME=~/.config
export VBACKUPDIR=~/.local/share/nvim/backup
# PATH
export PATH=$PATH:~/scripts/bin

## LANGUAGE
# python
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
# ruby
eval "$(rbenv init -)"
