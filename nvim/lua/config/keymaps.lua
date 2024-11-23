local keymap = vim.keymap.set

-- Normal Mode
keymap("n", "<C-g>", "1<C-g>")
keymap("n", "<Esc><Esc>", "<cmd>noh<CR>", { silent = true })
keymap("n", "Y", "y$")
keymap("n", "x", '"_x')
keymap("n", "go", "<cmd>call append(expand('.'), '')<CR>j", { remap = true, silent = true })
keymap("n", "j", "gj")
keymap("n", "k", "gk")
keymap("n", "gh", "^")
keymap("n", "gl", "$")
keymap("n", "+", "3<C-w>+")
keymap("n", "_", "3<C-w>-")
keymap("n", "=", "3<C-w>>")
keymap("n", "-", "3<C-w><")
keymap("n", "<Leader>w", "<cmd>bdelete<CR>", { silent = true })

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
    keymap("n", "[tab]" .. tabn, "<cmd>tabnext" .. tabn .. "<CR>",  { silent = true })
  else
    keymap("n", "[tab]" .. tabn, "<cmd>tablast<CR>",  { silent = true })
  end
end
keymap("n", "[tab]t", "<cmd>tablast <bar> tabnew<CR>",  { silent = true })
keymap("n", "[tab]w", "<cmd>tabclose<CR>",  { silent = true })
keymap("n", "[tab]o", "<cmd>tabonly<CR>",  { silent = true })
keymap("n", "[tab]n", "<cmd>tabnext<CR>",  { silent = true })
keymap("n", "[tab]p", "<cmd>tabprev<CR>",  { silent = true })
keymap("n", "[tab]m", "<cmd>wincmd T<CR>",  { silent = true })
keymap("n", "[tab]h", "<cmd>tabm -1<CR>",  { silent = true })
keymap("n", "[tab]l", "<cmd>tabm +1<CR>",  { silent = true })
-- s/S as [sub/SUB]
keymap("n", "[sub]", "", { remap = false })
keymap("n", "s", "[sub]", { remap = true })
keymap("n", "[SUB]", "", { remap = false })
keymap("n", "S", "[SUB]", { remap = true })
keymap("n", "[sub]s", ":%s///gI<Left><Left><Left><Left>")
keymap("n", "[sub]*", ":%s/<C-r>//gI<Left><Left><Left>")
keymap("n", "[sub]n", "<cmd>bnext<CR>",  { silent = true })
keymap("n", "[sub]p", "<cmd>bprev<CR>",  { silent = true })
keymap("n", "[sub]l", "<cmd>FzfLua buffers<CR>",  { silent = true })
keymap("n", "[sub]f", "<cmd>FzfLua files<CR>",  { silent = true })
keymap("n", "[sub]g", '<cmd>FzfLua grep search=""<CR>',  { silent = true })
keymap("n", "[sub]i", "<cmd>FzfLua changes<CR>",  { silent = true })
keymap("n", "[sub]j", "<cmd>FzfLua jumps<CR>",  { silent = true })
keymap("n", "[sub]m", "<cmd>FzfLua marks<CR>",  { silent = true })
keymap("n", "[sub]r", "<cmd>FzfLua registers<CR>",  { silent = true })
keymap("n", "[sub]d", "<cmd>FzfLua diagnostics_document<CR>",  { silent = true })
keymap("n", "[sub]o", "<cmd>FzfLua lsp_document_symbols<CR>",  { silent = true })
keymap("n", "[sub]t", "<cmd>FzfLua lsp_workspace_symbols<CR>",  { silent = true })
keymap("n", "[sub].", "<cmd>FzfLua blines<CR>",  { silent = true })
keymap("n", "[sub]/", "<cmd>FzfLua lines<CR>",  { silent = true })
keymap("n", "[sub]y", "<cmd>FzfLua oldfiles<CR>",  { silent = true })
keymap("n", "[sub]c", "<cmd>FzfLua command_history<CR>",  { silent = true })
keymap("n", "[sub]q", "<cmd>FzfLua search_history<CR>",  { silent = true })
keymap("n", "[sub]:", "<cmd>FzfLua commands<CR>",  { silent = true })
keymap("n", "[sub]h", "<cmd>FzfLua helptags<CR>",  { silent = true })
keymap("n", "[sub]?", "<cmd>FzfLua keymaps<CR>",  { silent = true })
-- <Space>c as [code]
keymap("n", "[code]", "", { remap = false })
keymap("n", "<Space>c", "[code]", { remap = true })
keymap("n", "[code]?", "<cmd>FzfLua lsp_finer<CR>",  { silent = true })
keymap("n", "[a", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true })
keymap("n", "]a", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true })
keymap("n", "<C-\\>", "<cmd>FzfLua lsp_references ignore_current_line=true includeDeclaration=false<CR>", { silent = true })
keymap("n", "[code]i", "<cmd>FzfLua lsp_incoming_calls<CR>", { silent = true })
keymap("n", "[code]o", "<cmd>FzfLua lsp_outgoing_calls<CR>", { silent = true })
keymap("n", "[code]a", "<cmd>FzfLua lsp_code_actions<CR>",  { silent = true })
keymap("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })
keymap("v", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })
keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true })
keymap("v", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true })
-- <Space>g as [git]
keymap("n", "[git]", "", { remap = false })
keymap("n", "<Space>g", "[git]", { remap = true })
keymap("n", "[git]s", "<cmd>Git<CR>",  { silent = true })
keymap("n", "[git]d", "<cmd>Gvdiff<CR>",  { silent = true })
keymap("n", "[git]m", "<cmd>GFiles?<CR>",  { silent = true })
keymap("n", "[git]b", "<cmd>Git blame<CR>",  { silent = true })
keymap("n", "[git]c", "<cmd>FzfLua git_bcommits<CR>",  { silent = true })
keymap("n", "[git]l", "<cmd>FzfLua git_commits<CR>",  { silent = true })
keymap("n", "[git]i", "<cmd>GitMessenger<CR>",  { silent = true })
keymap("n", "[d", "<cmd>Gitsigns prev_hunk<CR>",  { silent = true })
keymap("n", "]d", "<cmd>Gitsigns next_hunk<CR>",  { silent = true })
-- Misc
keymap("n", "?", "<cmd>Lazy home<CR>",  { silent = true })
keymap("n", "<Leader>s", "<cmd>SessionSelect<CR>",  { silent = true })
keymap("n", "<Leader>d", "<cmd>SessionDelete<CR>",  { silent = true })
keymap("n", "<Space>n", "<cmd>Neotree position=left toggle<CR>",  { silent = true })
keymap("n", "<Space>v", "<cmd>Neotree document_symbols position=right toggle<CR>",  { silent = true })
keymap("n", "<Space>u", "<cmd>MundoToggle<CR>",  { silent = true })
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
