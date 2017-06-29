"configuration of dein.vim
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"nerdtree config
nnoremap <silent><C-n> :NERDTree<CR>

"jedi costumize
let g:jedi#rename_command = "<leader>R"

""quickrun config -- halted, due to the need of runnig XQuartz to async.
"let g:quickrun_config = {
"\ 	'*': {'runmode': 'async:remote:vimproc'},
"\ }
let g:quickrun_config = {
\  "_" : {
\    "outputter/buffer/split" : ":botright",
\    "outputter/buffer/close_on_empty" : 1
\  }
\}
let g:quickrun_no_default_key_mappings = 1
nnoremap \r :write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR>

"vim basic config
syntax on
set number
set nobackup
set noundofile
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set ignorecase
set smartcase

"enable backspace to delete those
set backspace=indent,eol,start

"close help with q
autocmd FileType help nnoremap <buffer> q <C-w>c
noremap q :<C-u>bw! \[quickrun\ output\]<CR>
