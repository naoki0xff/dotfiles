"vimrc
"requirement:vim=NVIM v0.2.0 or later

"----------------------------------------------------------------------------
"configuration
"----------------------------------------------------------------------------
"appearance
nnoremap <C-g> 2<C-g>
set number
set display=lastline
set pumheight=10
"backup
set backup
set backupdir=~/.local/share/nvim/backup 
set noundofile
"indent
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"search
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrapscan
"enable backspace for delete
set backspace=indent,eol,start
"cursor (normal mode)
nnoremap j gj
nnoremap k gk
"cursor (insert mode)
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
"cursor (command mode)
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <C-E><C-U>
"close help with q
autocmd FileType help nnoremap <buffer> q <C-w>c
"clipboard integration
set clipboard+=unnamedplus
"japanese ZENKAKU
set ambiwidth=double

""sub commands
nnoremap [sub] <Nop>
nmap s [sub]
"match
"nnoremap <silent> [sub]/ :Denite line<CR>
nnoremap [sub]c :%s//&/gn<Left><Left><Left><Left><Left>
nnoremap [sub]C :%s/\<\>/&/gn<Left><Left><Left><Left><Left><Left><Left>
"substituiton
nnoremap [sub]* *:%s/<C-r>///g<Left><Left>
nnoremap [sub]s :%s///g<Left><Left><Left>
"buffer (list,next,previous,history,grep)
nnoremap <silent> [sub]l :ls<CR>
nnoremap <silent> [sub]n :bn<CR>
nnoremap <silent> [sub]p :bp<CR>
nnoremap <silent> [sub]y :bro ol<CR>
"nnoremap <silent> [sub]g :Denite grep<CR>
"DiffOrig
nnoremap <silent> [sub]d :DiffOrig<CR> 

""user defined command (alphabetic order)
":Comp (Comparing two or more files)
function! s:compare(...)
  if a:0 == 1
    tabedit %:p
	setl scrollbind
    exec 'rightbelow vnew ' . a:1
	setl scrollbind
  else
    exec 'tabedit ' . a:1
    setl scrollbind
    for l:file in a:000[1 :]
      exec 'rightbelow vnew ' . l:file
      setl scrollbind
    endfor
  endif
endfunction
command! -bar -nargs=+ -complete=file Compare  call s:compare(<f-args>)
":Diff (use diff mode)
function! s:vimdiff_in_newtab(...)
  if a:0 == 1
    tabedit %:p
    exec 'rightbelow vertical diffsplit ' . a:1
  else
    exec 'tabedit ' . a:1
    for l:file in a:000[1 :]
      exec 'rightbelow vertical diffsplit ' . l:file
    endfor
  endif
endfunction
command! -bar -nargs=+ -complete=file Diff  call s:vimdiff_in_newtab(<f-args>)
"highlight setting
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
":DiffOrig (view changes from last save on current buffer)
command DiffOrig tabedit % | rightb vert new | set buftype=nofile | read ++edit # | 0d_| diffthis | wincmd p | diffthis
":Vimrc (jump to ~/.vimrc)
command! Vimrc :tabedit ~/.vimrc

""window control
"select window area
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""tab control
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2
"prefix
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
"jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"create,x(close),next,previous,only
map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>
map <silent> [Tag]o :tabonly<CR>

"----------------------------------------------------------------------------
"plugin configuration
"----------------------------------------------------------------------------
""dein.vim
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
filetype plugin indent on
syntax on

""denite.vim
"-- all the keymappings are written in 'configuration' section 
"enable buffer change w/o saving
set hidden

""quickrun
let g:quickrun_config = {
\	"_" : {
\		"outputter/buffer/split" : ":botright",
\		"outputter/error/success" : "buffer",
\		"outputter/error/error/" : "quickfix",
\		"outputter/buffer/into" : "1",
\		"outputter/quickfix/errorformat" : "%f:%l,%m in %f on line %l",
\		"outputter/buffer/close_on_empty" : 1,
\		"outputter" : "error"
\  }
\}
let g:quickrun_no_default_key_mappings = 1
nnoremap \r :write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
au FileType qf nnoremap <silent><buffer>q :quit<CR>

"----------------------------------------------------------------------------
"etc:documentation for trouble shooting
"----------------------------------------------------------------------------
"when runtimepath is redefined within vimrc, 'syntax on' must be written after that line.
