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
"search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
"backspace for deletion
set backspace=indent,eol,start
"cursor (normal mode)
nnoremap j gj
nnoremap k gk
"cursor (insert mode)
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
"cursor (command mode)
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <C-E><C-U>
"remenber last cursor position
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
"clipboard integration
set clipboard+=unnamedplus
"drawing ZENKAKU symbol
set ambiwidth=double
"hilight
highlight Search ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

""sub command
nnoremap [sub] <Nop>
nmap s [sub]
nnoremap [SUB] <Nop>
nmap S [SUB]
"search/substituiton
nnoremap [sub]* *:%s/<C-r>///g<Left><Left>
nnoremap [sub]s :%s///g<Left><Left><Left>
"Diff last_save/last_backup
nnoremap <silent> [sub]d :DiffOrig<CR>
nnoremap <silent> [sub]D :Diff % ~/.local/share/nvim/backup/%~<CR>
""Denite and else
"buffer (list,reload,next,previous,grep)
set hidden
nnoremap <silent> [sub]l :Denite -cursor-wrap -mode=normal -winheight=16 buffer<CR>
nnoremap <silent> [sub]r :BufDel<CR>
nnoremap <silent> [sub]n :bn<CR>
nnoremap <silent> [sub]p :bp<CR>
nnoremap [sub]/ :bufdo !ag -H '' %<Left><Left><Left>
"search various
nnoremap <silent> [sub]y :Denite -winheight=10 file_old<CR>
nnoremap <silent> [sub]g :Denite -no-empty grep<CR>
nnoremap <silent> [sub]o :Denite -no-quit -mode=normal -cursor-wrap -auto-resize outline<CR>
nnoremap <silent> [sub]f :Denite file_rec<CR>
"resume latest denite source
nnoremap <silent> [sub]; :Denite -resume<CR>

""user defined function/command
"Comp <- copare files side by side
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
"DeleteHiddenBuffers <- delete hidden buffer
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
command! BufDel call DeleteHiddenBuffers()
"Diff <- diff view
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
"DiffOrig <- show modified from last change
command DiffOrig tabedit % | rightb vert new | set buftype=nofile | read ++edit # | 0d_| diffthis | wincmd p | diffthis
"HandleURI <- open url with preset browser
function! HandleURI()
  let l:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo l:uri
  if l:uri != ""
    exec "!open \"" . l:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
nnoremap <Leader>w :<C-u>call HandleURI()<CR>
"Vimrc <- open ~/.vimrc with tab
command! Vimrc tabedit ~/.vimrc

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
nnoremap    [Tab]   <Nop>
nmap    t [Tab]
"jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tab]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"create,edit,x[close],next(last),previous(first),only
map <silent> [Tab]c :tablast <bar> tabnew<CR>
map <silent> [Tab]x :tabclose<CR>
map <silent> [Tab]n :tabnext<CR>
map <silent> [Tab]N :tabl<CR>
map <silent> [Tab]p :tabprevious<CR>
map <silent> [Tab]P :tabfir<CR>
map <silent> [Tab]o :tabonly<CR>

""FILETYPE  -- also see [sub] commands for filetype shortcut
"vim:open help with K,close with q
autocmd Filetype vim set keywordprg=:help
autocmd FileType help nnoremap <buffer> q <C-w>c
"c:gf{path_to_header}
augroup GfPathGroup
  autocmd!
  autocmd FileType c setlocal path+=/usr/local/include,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include
augroup END

"----------------------------------------------------------------------------
"plugin initialization	<-	configuration within ~/.dein{.toml,_lazy.toml}
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

"----------------------------------------------------------------------------
"etc:documentation for trouble shooting
"----------------------------------------------------------------------------
"when runtimepath is redefined within vimrc, 'syntax on' must be written after that line.
