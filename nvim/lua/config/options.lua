local opt = vim.opt

-- Encoding
opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- Apperence
opt.termguicolors = true
opt.winblend = 15
opt.number = true
opt.display = 'lastline'
opt.pumheight = 10
opt.laststatus = 3
opt.ambiwidth = 'double'
opt.completeopt:remove({ 'preview' })
opt.lazyredraw = true
opt.shortmess:append({ c = true })
opt.signcolumn = 'yes'

-- Buffer
opt.hidden = true

-- Backup
opt.autoread = true
opt.backup = true
opt.backupdir = os.getenv("HOME") .. '/.local/share/nvim/backup'
opt.undofile = true
opt.undodir = os.getenv("HOME") .. '/.local/share/nvim/undo'

-- Session
opt.sessionoptions:append({ 'winpos', 'terminal', 'folds' })

-- Clipboard
opt.clipboard:append({ 'unnamedplus' })

-- Mouse
opt.mouse = 'a'

-- Edit
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.wildoptions = 'pum'
opt.backspace = 'indent,eol,start'
opt.virtualedit = 'block'
opt.diffopt = 'internal,filler,indent-heuristic,algorithm:histogram'

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.wrapscan = true
opt.ignorecase = true
opt.smartcase = true

-- ctags
opt.tags = '.tags;~'
