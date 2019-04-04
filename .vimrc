"vimrc
"requirement:vim=NVIM v0.2.0 or later

"----------------------------------------------------------------------------
"configuration
"----------------------------------------------------------------------------
"init{{{
scriptencoding utf-8
"appearance
set number
set display=lastline
set pumheight=10
set statusline=%y\ %r%h%w%-0.37f%m%=ROW=%l/%L,COL=%c\ %{ObsessionStatus('[$:loading]','[$:paused]')}%{LinterStatus()}
set laststatus=2
set ambiwidth=double
set clipboard+=unnamedplus
set completeopt-=preview
"buffer
set hidden
"backup
set backup
set backupdir=~/.local/share/nvim/backup 
set undofile
set undodir=~/.local/share/nvim/undo
"indent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set breakindent
"search
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase
"backspace for deletion
set backspace=indent,eol,start
"visual select expansion
set virtualedit=block
"ctags
set tags=.tags;~
"remenber last cursor position
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
"others
set autoread
set updatetime=100
"}}}

""keymap{{{
"normal
nnoremap <C-g> 1<C-g>
nnoremap <silent> <Esc><Esc> :noh<CR>
nnoremap Y y$
nnoremap x "_x
nmap <silent> go :<C-u>call append(expand('.'), '')<Cr>j
nnoremap j gj
nnoremap k gk
nnoremap gh ^
nnoremap gl $
"insert
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
"visual
vnoremap * y/<C-R>"<CR>
"command
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <C-E><C-U>
cabbrev Q q
cabbrev Qa qa
cabbrev q1 q!
cabbrev qa1 qa!
"window
nnoremap <silent>+ 3<C-w>+
nnoremap <silent>_ 3<C-w>-
nnoremap <silent>= 3<C-w>>
nnoremap <silent>- 3<C-w><
nnoremap <C-w>f :vertical rightbelow wincmd f<CR>
nnoremap <C-w>gf :rightbelow wincmd f<CR>
nnoremap <silent> <C-w>] :vertical rightbelow wincmd ]<CR><C-g>
nnoremap <silent> <C-w><C-]> :rightbelow wincmd ]<CR><C-g>
"custom
"[sub],[SUB] as prefix
nnoremap [sub] <Nop>
nmap s [sub]
nnoremap [SUB] <Nop>
nmap S [SUB]
"[sub]+any
nnoremap [sub]s :%s///gI<Left><Left><Left><Left>
nnoremap [sub]* *:%s/<C-r>///gI<Left><Left><Left>
nnoremap <silent> [sub]n :bnext<CR>
nnoremap <silent> [sub]p :bprev<CR>
"[SUB]+any
"<Leader>+any
nnoremap <silent> <Leader>w :BD<CR>
nnoremap <silent> <Leader>q :CleanEmptyBuffers<CR>
nnoremap <silent> <Leader>Q :BufDel<CR>
"}}}

""functions{{{
"DeleteHiddenBuffers = delete hidden buffer
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
command! BufDel call DeleteHiddenBuffers()
"CleanEmptyBuffers = delete empty buffers
function! s:CleanEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
endfunction
command! CleanEmptyBuffers call s:CleanEmptyBuffers()
"DiffOrig = show modified from last change
command DiffOrig tabedit % | rightb vert new | set buftype=nofile | read ++edit # | 0d_| diffthis | wincmd p | diffthis
"ScrollBind = scrollbind both window
function! ScrollBind(...)
  let l:curr_bufnr = bufnr('%')
  let g:scb_status = ( a:0 > 0 ? a:1 : !exists('g:scb_status') || !g:scb_status )
  if !exists('g:scb_pos') | let g:scb_pos = {} | endif

  let l:loop_cont = 1
  while l:loop_cont
    setl noscrollbind
    if !g:scb_status && has_key( g:scb_pos, bufnr('%') )
      call setpos( '.', g:scb_pos[ bufnr('%') ] )
    endif
    execute 'wincmd w'
    let l:loop_cont = !( l:curr_bufnr == bufnr('%') )
  endwhile

  if g:scb_status
    let l:loop_cont = 1
    while l:loop_cont
      let g:scb_pos[ bufnr('%') ] = getpos( '.' )
      normal! gg
      setl scrollbind
      execute 'wincmd w'
      let l:loop_cont = !( l:curr_bufnr == bufnr('%') )
    endwhile
  else
    let g:scb_pos = {}
  endif
endfunction
"}}}

""tab{{{
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
function! s:my_tabline()
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
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2
"prefix
nnoremap    [Tab]   <Nop>
nmap    t [Tab]
"jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tab]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"new,new(to next),clone,close(only),next(last),previous(first),tag,path,move
nnoremap <silent> [Tab]t :tablast <bar> tabnew<CR>
nnoremap <silent> [Tab]<C-t> :tabnew<CR>
nnoremap <silent> [Tab]T :tabe %<CR>
nnoremap <silent> [Tab]w :tabclose<CR>
nnoremap <silent> [Tab]o :tabonly<CR>
nnoremap <silent> [Tab]n :tabnext<CR>
nnoremap <silent> [Tab]N :tabl<CR>
nnoremap <silent> [Tab]p :tabprevious<CR>
nnoremap <silent> [Tab]P :tabfir<CR>
nnoremap <silent> [Tab]<C-]> <C-w><C-]><C-w>T<C-g>
nnoremap <silent> [Tab]f <C-w>gf
nnoremap <silent> [Tab]m :wincmd T<CR>
nnoremap <silent> [Tab]h :tabm -1<CR>
nnoremap <silent> [Tab]l :tabm +1<CR>
nnoremap <silent> [Tab]H :tabm 0<CR>
nnoremap <silent> [Tab]L :tabm $<CR>
"}}}

""vimlocal"{{{
"augroup vimrc_local
"  autocmd!
"  autocmd BufEnter * call s:vimrc_local(expand('<afile>:p:h'))
"augroup END
"function! s:vimrc_local(loc)
"  let files = findfile('.vimlocal', escape(a:loc, ' ') . ';', -1)
"  for i in reverse(filter(files, 'filereadable(v:val)'))
"    source `=i`
"  endfor
"endfunction
"}}}

"----------------------------------------------------------------------------
"plugin settings
"----------------------------------------------------------------------------
"dein{{{
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
"}}}
"LSP{{{
augroup LSP
    autocmd!
    autocmd BufEnter __LanguageClient__ nnoremap <buffer> q <C-w>c
augroup END
augroup Pyls
    autocmd!
    autocmd Filetype python nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    autocmd Filetype python nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
    autocmd Filetype python nnoremap <silent> <C-\> :call LanguageClient#textDocument_references()<CR>
    autocmd Filetype python nnoremap <silent> <Leader>f :call LanguageClient#textDocument_formatting()<CR>
augroup END
"}}}
"vdebug{{{
nnoremap [vdb] <Nop>
nmap <Space>d [vdb]
nnoremap <silent> [vdb]l :BreakpointWindow<CR>
nnoremap <silent> [vdb]q :BreakpointRemove *<CR>
"MEMO: after eval, you can go back to list with 'u'. from list, <Enter> acts almost in same way
let g:vdebug_keymap = {
\  'run' : '<C-n>',
\  'run_to_cursor' : '<C-m>',
\  'step_over' : '[vdb]n',
\  'step_into' : '[vdb]i',
\  'step_out' : '[vdb]N',
\  'set_breakpoint' : '<Space>m',
\  'eval_under_cursor' : '[vdb]e',
\  'detach' : '[vdb]c',
\  'close' : '[vdb]C',
\}
"remote: {ide_key,path_maps(remote:local)}
let g:vdebug_options = {
\    'port' : 9000,
\    'timeout' : 20,
\    'server' : '',
\    'on_close' : 'detach',
\    'break_on_open' : 0,
\    'ide_key' : '',
\    'debug_window_level' : 0,
\    'debug_file_level' : 0,
\    'debug_file' : '',
\    'path_maps' : {},
\    'watch_window_style' : 'expanded',
\    'marker_default' : '⬦',
\    'marker_closed_tree' : '▸',
\    'marker_open_tree' : '▾',
\    'sign_breakpoint' : '▷',
\    'sign_current' : '▶',
\    'continuous_mode'  : 1
\}
"}}}
"defx: experimental{{{
nnoremap <silent> <Space>n :Defx -split=vertical -toggle -winwidth=35<CR>
"nnoremap <silent> <Space>n :Defx -split=floating -toggle<CR>
call defx#custom#column('filename', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ 'min_width': 40,
      \ 'max_width': 40,
      \ })
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })
autocmd FileType defx call s:defx_my_settings()
"TODO: set defx root directory to chosen on <CR>, is_open_tree() on current cursor position
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> O
  \ defx#is_opened_tree() ?
  \ defx#do_action('close_tree') :
  \ defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> i
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v
  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t
  \ defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> ..
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> <C-c>
  \ defx#do_action('clear_select_all')
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent> ?
  \ :h defx.txt<CR>
endfunction
"}}}
"denite{{{
call denite#custom#map('insert','<C-a>','<denite:move_caret_to_head>','noremap')
call denite#custom#map('insert','<C-e>','<denite:move_caret_to_tail>','noremap')
call denite#custom#map('insert','<C-f>','<denite:move_caret_to_right>','noremap')
call denite#custom#map('insert','<C-b>','<denite:move_caret_to_left>','noremap')
call denite#custom#map('insert','<C-j>','<denite:move_to_next_line>','noremap')
call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')
call denite#custom#map('insert','<C-k>','<denite:move_to_previous_line>','noremap')
call denite#custom#map('insert','<C-p>','<denite:move_to_previous_line>','noremap')
call denite#custom#map('insert','<C-d>','<denite:scroll_page_forwards>','noremap')
call denite#custom#map('insert','<C-u>','<denite:scroll_page_backwards>','noremap')
nnoremap <silent> [sub]l :Denite buffer -winheight=8 -cursor-wrap -smartcase<CR>
nnoremap <silent> [sub]j :Denite jump<CR>
nnoremap <silent> [sub]o :Denite outline -smartcase<CR>
nnoremap <silent> [sub]t :Denite tag -smartcase<CR>
let s:menus = {}
let s:menus.vim = { 'description': 'vim configuration files' }
let s:menus.vim.file_candidates = [['init.vim','~/.config/nvim/init.vim'],['vimrc','~/.vimrc'],['dein.toml','~/.dein.toml'],['dein_lazy.toml','~/.dein_lazy.toml']]
let s:menus.zsh = { 'description': 'shell configuration files' }
let s:menus.zsh.file_candidates = [['zshrc','~/.zshrc'],['zprofile','~/.zprofile']]
let s:menus.tmux = { 'description': 'tmux configuration files' }
let s:menus.tmux.file_candidates = [['tmux.conf','~/.tmux.conf']]
call denite#custom#var('menu','menus',s:menus)
nnoremap <silent> [sub], :Denite menu<CR>
"extra sources
"from LanguageClient-neovim
nnoremap <silent> [sub]c :Denite contextMenu<CR>
"}}}
"fzf{{{
nnoremap <silent> [sub]f :Files<CR>
nnoremap <silent> [sub]g :FAg<CR>
nnoremap <silent> [sub]G :Ag<CR>
nnoremap <silent> [sub]m :Marks<CR>
nnoremap <silent> [sub]w :Windows<CR>
nnoremap <silent> [sub]. :BLines<CR>
nnoremap <silent> [sub]/ :Lines<CR>
nnoremap <silent> [sub]y :History<CR>
nnoremap <silent> [sub]: :History:<CR>
nnoremap <silent> [sub]? :Commands<CR>
nnoremap <silent> [sub]h :Helptags<CR>
"}}}
"others{{{
"anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
"vim-trip
nmap <silent> g<C-a> <Plug>(trip-increment-ignore-minus)
nmap <silent> g<C-x> <Plug>(trip-decrement-ignore-minus)
"edgemotion
nmap ]b <Plug>(edgemotion-j)
nmap [b <Plug>(edgemotion-k)
"neosnippet
nnoremap <silent> [sub]e :NeoSnippetEdit<CR>
"undotree
nnoremap <silent> <Space>u :MundoToggle<CR>
"tagbar
nnoremap <silent> <Space>t :TagbarToggle<CR>
"quickhl
nmap <Space>h <plug>(quickhl-manual-this)
vmap <Space>h <plug>(quickhl-manual-this)
nmap <Space>H <plug>(quickhl-manual-reset)
"git:fugitive;fzf;GitGutter
set nofixeol
nnoremap [git] <Nop>
nmap <Space>g [git]
nnoremap <silent> [git]s :Gstatus<CR>
nnoremap <silent> [git]d :Gvdiff<CR>
nnoremap <silent> [git]m :GFiles?<CR>
nnoremap <silent> [git]v :GitGutterPreviewHunk<CR><C-w>b
nnoremap <silent> [d :GitGutterPrevHunk<CR>
nnoremap <silent> ]d :GitGutterNextHunk<CR>
nnoremap <silent> [git]b :Gblame<CR>
nnoremap <silent> [git]c :BCommits<CR>
nnoremap <silent> [git]l :Commits<CR>
"vim-obsession;{create/halt-recording},destroy
nnoremap <silent> <Leader>o :Obsession<CR>
nnoremap <silent> <Leader>O :Obsession!<CR>
"scrollbind shortcut
nnoremap <silent> <Leader>b :call ScrollBind()<CR>
"Diffs
nnoremap <Leader>dw :windo diffthis<CR>
vnoremap <Leader>dl :Linediff<CR>
nnoremap <Leader>db :DiffOrig<CR>
"}}}

"----------------------------------------------------------------------------
"finalize
"----------------------------------------------------------------------------
"{{{
filetype plugin indent on
syntax on
"autocmds
augroup vimrc
    autocmd!
    autocmd Filetype vim set keywordprg=:help
    autocmd Filetype vim setlocal foldmethod=marker
    autocmd FileType help,diff,Preview,ref* nnoremap <buffer> q <C-w>c
    autocmd FileType c setlocal path+=/usr/local/include,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/macosx.sdk/usr/include,/Users/naoki/scripts/src/util-linux/util-linux-2.31-rc1/include 
    autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 iskeyword+=?
    autocmd BufNewFile,BufRead *.xaml setfiletype xml
    autocmd BufNewFile,BufRead *.csv setfiletype csv
    autocmd ColorScheme * highlight Normal ctermbg=none
    autocmd ColorScheme * highlight LineNr ctermbg=none
augroup END
"colorscheme
colorscheme railscasts
"highlight
highlight HighlightWords ctermfg=black ctermbg=yellow
match HighlightWords /TODO\|NOTE\|MEMO/
highlight Search ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
highlight NonText cterm=bold ctermfg=248 guifg=248
"}}}
