local opt = vim.opt

-- Encoding
opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- Apperence
opt.number = true
opt.display = 'lastline'
opt.pumheight = 10
opt.laststatus = 2
opt.ambiwidth = 'double'
opt.completeopt:remove({ 'preview' })
opt.lazyredraw = true
opt.shortmess:append({ c = true })
opt.signcolumn = 'yes'

-- Buffer
opt.hidden = true

-- Backup
opt.backup = true
opt.backupdir = os.getenv("HOME") .. '/.local/share/nvim/backup'
opt.undofile = true
opt.undodir = os.getenv("HOME") .. '/.local/share/nvim/undo'

-- Clipboard
opt.clipboard:append({ 'unnamedplus' })

-- Mouse
opt.mouse = 'a'

-- Edit
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.wildoptions = 'pum'
opt.backspace = 'indent,eol,start'
opt.virtualedit = 'block'

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.wrapscan = true
opt.ignorecase = true
opt.smartcase = true
