local keymap = vim.keymap.set
local nopts = { noremap = true, silent = true }
local iopts = { noremap = true, silent = false }
local vopts = { noremap = true, silent = false }
local copts = { noremap = true, silent = false }

-- Normal Mode
keymap("n", "<C-g>", "1<C-g>", nopts)
keymap("n", "<Esc><Esc>", ":noh<CR>", nopts)
keymap("n", "Y", "y$", nopts)
keymap("n", "x", '"_x', nopts)
keymap("n", "go", ":<C-u>call append(expand('.'), '')<CR>j", { noremap = false, silent = true })
keymap("n", "j", "gj", nopts)
keymap("n", "k", "gk", nopts)
keymap("n", "gh", "^", nopts)
keymap("n", "gl", "$", nopts)

-- Insert Mode
keymap("i", "<C-a>", "<C-o>^", iopts)
keymap("i", "<C-e>", "<C-o>$", iopts)
keymap("i", "<C-b>", "<Left>", iopts)
keymap("i", "<C-f>", "<Right>", iopts)

-- Visual Mode
keymap("v", "*", 'y/<C-R>"<CR>', vopts)

-- EX Mode
keymap("c", "<C-a>", "<Home>", copts)
keymap("c", "<C-e>", "<End>", copts)
keymap("c", "<C-b>", "<Left>", copts)
keymap("c", "<C-f>", "<Right>", copts)
keymap("c", "<C-k>", "<C-E><C-U>", copts)

-- Custom
-- t as [Tab]
keymap("n", "t", "<Nop>", nopts)
keymap("n", "tt", ":tablast <bar> tabnew<CR>", nopts)
keymap("n", "tw", ":tabclose<CR>", nopts)
keymap("n", "to", ":tabonly<CR>", nopts)
keymap("n", "tn", ":tabnext<CR>", nopts)
keymap("n", "tp", ":tabprev<CR>", nopts)
keymap("n", "tm", ":wincmd T<CR>", nopts)
keymap("n", "th", ":tabm -1<CR>", nopts)
keymap("n", "tl", ":tabm +1<CR>", nopts)
-- s/S as [sub/SUB]
keymap("n", "s", "<Nop>", nopts)
keymap("n", "S", "<Nop>", nopts)
keymap("n", "sr", ":%s///gI<Left><Left><Left><Left>", nopts)
keymap("n", "s*", ":%s/<C-r>//gI<Left><Left><Left>", nopts)
keymap("n", "sn", ":bnext<CR>", nopts)
keymap("n", "sp", ":bprev<CR>", nopts)
keymap("n", "sl", ":Buffers<CR>", nopts)
keymap("n", "sf", ":Files<CR>", nopts)
keymap("n", "sg", ":Rg<CR>", nopts)
keymap("n", "si", ":Changes<CR>", nopts)
keymap("n", "sj", ":Jumps<CR>", nopts)
keymap("n", "sm", ":Marks<CR>", nopts)
keymap("n", "so", ":CocList outline<CR>", nopts)
keymap("n", "st", ":Tags<CR>", nopts)
keymap("n", "sw", ":Windows<CR>", nopts)
keymap("n", "s.", ":BLines<CR>", nopts)
keymap("n", "s/", ":Lines<CR>", nopts)
keymap("n", "sy", ":History<CR>", nopts)
keymap("n", "sc", ":History:<CR>", nopts)
keymap("n", "sq", ":History/<CR>", nopts)
keymap("n", "s:", ":Commands<CR>", nopts)
keymap("n", "s?", ":Helptags<CR>", nopts)
-- <Space>c as [coc]
keymap("n", "<Space>c", "<Nop>", nopts)
keymap("n", "<Space>c,", ":CocConfig<CR>", nopts)
keymap("n", "<Space>cl", "CocList<CR>", nopts)
keymap("n", "[a", "<Plug>(coc-diagnostic-prev)", { noremap = false, silent = true })
keymap("n", "]a", "<Plug>(coc-diagnostic-next)", { noremap = false, silent = true })
-- <Space>g as [git]
keymap("n", "<Space>g", "<Nop>", nopts)
keymap("n", "<Space>gs", ":Git<CR>", nopts)
keymap("n", "<Space>ga", ":GitGutterStageHunk<CR>", nopts)
keymap("n", "<Space>gd", ":Gvdiff<CR>", nopts)
keymap("n", "<Space>gm", ":GFiles?<CR>", nopts)
keymap("n", "<Space>gb", ":Git blame<CR>", nopts)
keymap("n", "<Space>gc", ":BCommits<CR>", nopts)
keymap("n", "<Space>gl", ":Commits<CR>", nopts)
keymap("n", "<Space>gi", ":GitMessenger<CR>", nopts)
keymap("n", "[d", "GitGutterPrevHunk<CR>", nopts)
keymap("n", "]d", "GitGutterNextHunk<CR>", nopts)
-- Misc
keymap("n", "<Space>n", ":CocCommand explorer<CR>", nopts)
keymap("n", "<Space>u", ":MundoToggle<CR>", nopts)
keymap("n", "<Space>h", "<Plug>(quickhl-manual-this)", { noremap = false, silent = true })
keymap("n", "<Space>H", "<Plug>(quickhl-manual-reset)", { noremap = false, silent = true })
keymap("v", "<Space>h", "<Plug>(quickhl-manual-this)", { noremap = false, silent = true })
keymap("n", "n", "<Plug>(anzu-n-with-echo)", { noremap = false, silent = true })
keymap("n", "N", "<Plug>(anzu-N-with-echo)", { noremap = false, silent = true })
keymap("n", "*", "<Plug>(anzu-star-with-echo)", { noremap = false, silent = true })
keymap("n", "#", "<Plug>(anzu-sharp-with-echo)", { noremap = false, silent = true })
keymap("n", "g<C-a>", "<Plug>(trip-increment-ignore-minus)", { noremap = false, silent = true })
keymap("n", "g<C-x>", "<Plug>(trip-decrement-ignore-minus)", { noremap = false, silent = true })
keymap("n", "]b", "<Plug>(edgemotion-j)", { noremap = false, silent = true })
keymap("n", "[b", "<Plug>(edgemotion-k)", { noremap = false, silent = true })
