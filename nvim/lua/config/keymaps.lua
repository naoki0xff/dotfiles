local keymap = vim.keymap.set

-- Normal Mode
keymap("n", "<C-g>", "1<C-g>")
keymap("n", "<Esc><Esc>", ":noh<CR>", { silent = true })
keymap("n", "Y", "y$")
keymap("n", "x", '"_x')
keymap("n", "go", ":<C-u>call append(expand('.'), '')<CR>j", { remap = true, silent = true })
keymap("n", "j", "gj")
keymap("n", "k", "gk")
keymap("n", "gh", "^")
keymap("n", "gl", "$")
keymap("n", "+", "3<C-w>+")
keymap("n", "_", "3<C-w>-")
keymap("n", "=", "3<C-w>>")
keymap("n", "-", "3<C-w><")
keymap("n", "<Leader>w", ":bdelete<CR>", { silent = true })

-- Insert Mode
keymap("i", "<C-a>", "<C-o>^")
keymap("i", "<C-e>", "<C-o>$")
keymap("i", "<C-b>", "<Left>")
keymap("i", "<C-f>", "<Right>")

-- Visual Mode
keymap("v", "*", 'y/<C-R>"<CR>')

-- EX Mode
keymap("c", "<C-a>", "<Home>")
keymap("c", "<C-e>", "<End>")
keymap("c", "<C-b>", "<Left>")
keymap("c", "<C-f>", "<Right>")
keymap("c", "<C-k>", "<C-E><C-U>")
vim.cmd.cabbrev("Q", "q")
vim.cmd.cabbrev("Qa", "qa")
vim.cmd.cabbrev("q1", "q!")
vim.cmd.cabbrev("qa1", "qa!")

-- Custom
-- t as [Tab]
keymap("n", "[tab]", "", { remap = false })
keymap("n", "t", "[tab]", { remap = true })
for tabn = 1,9 do
  if ( tabn ~= 9 ) then
    keymap("n", "[tab]" .. tabn, ":tabnext" .. tabn .. "<CR>",  { silent = true })
  else
    keymap("n", "[tab]" .. tabn, ":tablast<CR>",  { silent = true })
  end
end
keymap("n", "[tab]t", ":tablast <bar> tabnew<CR>",  { silent = true })
keymap("n", "[tab]w", ":tabclose<CR>",  { silent = true })
keymap("n", "[tab]o", ":tabonly<CR>",  { silent = true })
keymap("n", "[tab]n", ":tabnext<CR>",  { silent = true })
keymap("n", "[tab]p", ":tabprev<CR>",  { silent = true })
keymap("n", "[tab]m", ":wincmd T<CR>",  { silent = true })
keymap("n", "[tab]h", ":tabm -1<CR>",  { silent = true })
keymap("n", "[tab]l", ":tabm +1<CR>",  { silent = true })
-- s/S as [sub/SUB]
keymap("n", "[sub]", "", { remap = false })
keymap("n", "s", "[sub]", { remap = true })
keymap("n", "[SUB]", "", { remap = false })
keymap("n", "S", "[SUB]", { remap = true })
keymap("n", "[sub]r", ":%s///gI<Left><Left><Left><Left>")
keymap("n", "[sub]*", ":%s/<C-r>//gI<Left><Left><Left>")
keymap("n", "[sub]n", ":bnext<CR>",  { silent = true })
keymap("n", "[sub]p", ":bprev<CR>",  { silent = true })
keymap("n", "[sub]l", ":FzfLua buffers<CR>",  { silent = true })
keymap("n", "[sub]f", ":FzfLua files<CR>",  { silent = true })
keymap("n", "[sub]g", ':FzfLua grep search=""<CR>',  { silent = true })
keymap("n", "[sub]i", ":FzfLua changes<CR>",  { silent = true })
keymap("n", "[sub]j", ":FzfLua jumps<CR>",  { silent = true })
keymap("n", "[sub]m", ":FzfLua marks<CR>",  { silent = true })
keymap("n", "[sub]d", ":FzfLua diagnostics_document<CR>",  { silent = true })
keymap("n", "[sub]o", ":FzfLua btags<CR>",  { silent = true })
keymap("n", "[sub]t", ":FzfLua tags<CR>",  { silent = true })
keymap("n", "[sub].", ":FzfLua blines<CR>",  { silent = true })
keymap("n", "[sub]/", ":FzfLua lines<CR>",  { silent = true })
keymap("n", "[sub]y", ":FzfLua oldfiles<CR>",  { silent = true })
keymap("n", "[sub]c", ":FzfLua command_history<CR>",  { silent = true })
keymap("n", "[sub]q", ":FzfLua search_history<CR>",  { silent = true })
keymap("n", "[sub]:", ":FzfLua commands<CR>",  { silent = true })
keymap("n", "[sub]?", ":FzfLua helptags<CR>",  { silent = true })
-- <Space>c as [coc]
keymap("n", "[coc]", "", { remap = false })
keymap("n", "<Space>c", "[coc]", { remap = true })
keymap("n", "[coc],", ":CocConfig<CR>",  { silent = true })
keymap("n", "[coc]l", ":CocList<CR>",  { silent = true })
keymap("n", "[coc]?", ":FzfLua lsp_code_actions<CR>",  { silent = true })
keymap("n", "[a", "<Plug>(coc-diagnostic-prev)", { remap = true, silent = true })
keymap("n", "]a", "<Plug>(coc-diagnostic-next)", { remap = true, silent = true })
keymap("n", "<C-\\>", ":FzfLua lsp_references<CR>", { silent = true })
keymap("n", "<Leader>r", "<Plug>(coc-rename)", { remap = true, silent = true })
keymap("v", "<Leader>r", "<Plug>(coc-rename)", { remap = true, silent = true })
keymap("n", "<Leader>f", "<Plug>(coc-format)", { remap = true, silent = true })
keymap("v", "<Leader>f", "<Plug>(coc-format-selected)", { remap = true, silent = true })
-- <Space>g as [git]
keymap("n", "[git]", "", { remap = false })
keymap("n", "<Space>g", "[git]", { remap = true })
keymap("n", "[git]s", ":Git<CR>",  { silent = true })
keymap("n", "[git]d", ":Gvdiff<CR>",  { silent = true })
keymap("n", "[git]m", ":GFiles?<CR>",  { silent = true })
keymap("n", "[git]b", ":Git blame<CR>",  { silent = true })
keymap("n", "[git]c", ":FzfLua git_bcommits<CR>",  { silent = true })
keymap("n", "[git]l", ":FzfLua git_commits<CR>",  { silent = true })
keymap("n", "[git]i", ":GitMessenger<CR>",  { silent = true })
keymap("n", "[d", ":Gitsigns prev_hunk<CR>",  { silent = true })
keymap("n", "]d", ":Gitsigns next_hunk<CR>",  { silent = true })
-- Misc
keymap("n", "?", ":Lazy home<CR>",  { silent = true })
keymap("n", "<Leader>s", ":SessionSelect<CR>",  { silent = true })
keymap("n", "<Leader>d", ":SessionDelete<CR>",  { silent = true })
keymap("n", "<Space>n", ":CocCommand explorer<CR>",  { silent = true })
keymap("n", "<Space>u", ":MundoToggle<CR>",  { silent = true })
keymap("n", "<Space>h", "<Plug>(quickhl-manual-this)", { remap = true, silent = true })
keymap("n", "<Space>H", "<Plug>(quickhl-manual-reset)", { remap = true, silent = true })
keymap("v", "<Space>h", "<Plug>(quickhl-manual-this)", { remap = true, silent = true })
keymap("n", "n", "<Plug>(anzu-n-with-echo)", { remap = true, silent = true })
keymap("n", "N", "<Plug>(anzu-N-with-echo)", { remap = true, silent = true })
keymap("n", "*", "<Plug>(anzu-star-with-echo)", { remap = true, silent = true })
keymap("n", "#", "<Plug>(anzu-sharp-with-echo)", { remap = true, silent = true })
keymap("n", "<C-a>", "<Plug>(dial-increment)", { remap = true, silent = true })
keymap("n", "<C-x>", "<Plug>(dial-decrement)", { remap = true, silent = true })
keymap("n", "]b", "<Plug>(edgemotion-j)", { remap = true, silent = true })
keymap("n", "[b", "<Plug>(edgemotion-k)", { remap = true, silent = true })
