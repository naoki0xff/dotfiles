#user defined scripts and function
export PATH=$PATH:~/scripts/bin
source ~/scripts/bin/workdir.sh

#python config
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"
export BROWSER=/Applications/Vivaldi.app/Contents/MacOS/Vivaldi

#ruby config
eval "$(rbenv init -)"
