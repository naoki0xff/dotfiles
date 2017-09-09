#setting for cygwin terminal
export LANG=ja_JP.UTF-8
stty stop undef
#editor
export VBACKUPDIR=~/.local/share/nvim/backup
#path
export PATH=/cygdrive/c/anaconda:$PATH
export PATH=/cygdrive/c/anaconda/scripts:$PATH
export PATH=/cygdrice/c/program\ files/rstudio/bin:$PATH
export PATH=$PATH:~/scripts/bin
#function
source ~/scripts/bin/clip.sh
#tmux autoload
if [ -z $TMUX ];then
	if $(tmux has-session 2> /dev/null);then
		tmux -2 attach
	else
		tmux -2
	fi
fi

