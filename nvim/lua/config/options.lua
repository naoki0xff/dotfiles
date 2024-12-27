-- Encoding
vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- Apperence
vim.opt.termguicolors = true
vim.opt.winblend = 15
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.display = 'lastline'
vim.opt.pumheight = 10
vim.opt.laststatus = 3
vim.opt.ambiwidth = 'double'
vim.opt.completeopt:remove({ 'preview' })
vim.opt.lazyredraw = true
vim.opt.shortmess:append({ c = true })
vim.opt.signcolumn = 'yes'

-- Buffer
vim.opt.hidden = true

-- Backup
vim.opt.autoread = true
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("state") .. '/backup'
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. '/undo'

-- Session
vim.opt.sessionoptions:append({ 'winpos', 'terminal', 'folds' })

-- Clipboard
vim.opt.clipboard:append({ 'unnamedplus' })

-- Mouse
vim.opt.mouse = 'a'

-- Edit
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.completeopt = 'menu,menuone,noselect,preview'
vim.opt.wildoptions = 'pum'
vim.opt.backspace = 'indent,eol,start'
vim.opt.virtualedit = 'block'
vim.opt.diffopt = 'internal,filler,indent-heuristic,algorithm:histogram'

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ctags
vim.opt.tags = '.tags;~'

-- MISC
vim.opt.keywordprg = ":help"
vim.opt.fixeol = false
