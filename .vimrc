""dein.vim config

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

""denite.vim config
nnoremap [denite] <Nop>
nmap <C-m> [denite]
nnoremap <silent>[denite]b :<C-u>Denite buffer<CR>
nnoremap <silent>[denite]l :<C-u>Denite line<CR>
nnoremap <silent>[denite]f :<C-u>Denite file_rec<CR>
nnoremap <silent>[denite]d :<C-u>Denite directory_rec<CR>
nnoremap <silent>[denite]y :<C-u>Denite file_old<CR>
nnoremap <silent>[denite]g :<C-u>Denite grep<CR>
set hidden

""nerdtree config
nnoremap <silent><C-n> :NERDTree<CR>

""quickrun config
"let g:quickrun_config = {
"\ 	'*': {'runmode': 'async:remote:vimproc'},
"\ }
"-- halted, due to the need of runnig XQuartz to async.
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

""emmet config
inoremap [emmet] <Nop>
imap <C-e> [emmet]
autocmd FileType html imap <buffer><expr><C-e>
\	emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
\	"\<tab>"
let g:user_emmet_settings = {
\	'variables' : {
\	'lang' : 'ja'
\	}
\}

""vim original config
"view
syntax on
set number
set display=lastline
set pumheight=10
"file
set nobackup
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
"matcher	#need to add behaivour on '*'.
nnoremap <expr> / _(":%s/<Cursor>/&/gn")

function! s:move_cursor_pos_mapping(str, ...)
    let left = get(a:, 1, "<Left>")
    let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
    return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _(str)
    return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction
"enable backspace for delete
set backspace=indent,eol,start
"window
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <C-o>l
"close help with q
autocmd FileType help nnoremap <buffer> q <C-w>c

""tab control
"config
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
"prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
"jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"mapping create,x(close),next,prev
map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>
