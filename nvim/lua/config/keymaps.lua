-- Normal Mode
vim.keymap.set("n", "<C-g>", "1<C-g>")
vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<CR>", { silent = true })
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "go", "<cmd>call append(expand('.'), '')<CR>j", { remap = true, silent = true })
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "gh", "^")
vim.keymap.set("n", "gl", "$")
vim.keymap.set("n", "+", "3<C-w>+")
vim.keymap.set("n", "_", "3<C-w>-")
vim.keymap.set("n", "=", "3<C-w>>")
vim.keymap.set("n", "-", "3<C-w><")
vim.keymap.set("n", "<Leader>w", "<cmd>bdelete<CR>", { silent = true })

-- Insert Mode
vim.keymap.set("i", "<C-a>", "<C-o>^")
vim.keymap.set("i", "<C-e>", "<C-o>$")
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")

-- Visual Mode
vim.keymap.set("v", "*", 'y/<C-R>"<CR>')

-- EX Mode
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<C-b>", "<Left>")
vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<C-k>", "<C-E><C-U>")
vim.cmd.cabbrev("Q", "q")
vim.cmd.cabbrev("Qa", "qa")
vim.cmd.cabbrev("q1", "q!")
vim.cmd.cabbrev("qa1", "qa!")

-- Custom
-- Tab
vim.keymap.set("n", "[tab]", "", { remap = false })
vim.keymap.set("n", "t", "[tab]", { remap = true })
for tabn = 1,9 do
  if ( tabn ~= 9 ) then
    vim.keymap.set("n", "[tab]" .. tabn, "<cmd>tabnext" .. tabn .. "<CR>",  { silent = true })
  else
    vim.keymap.set("n", "[tab]" .. tabn, "<cmd>tablast<CR>",  { silent = true })
  end
end
vim.keymap.set("n", "[tab]t", "<cmd>tablast <bar> tabnew<CR>",  { silent = true })
vim.keymap.set("n", "[tab]w", "<cmd>tabclose<CR>",  { silent = true })
vim.keymap.set("n", "[tab]o", "<cmd>tabonly<CR>",  { silent = true })
vim.keymap.set("n", "[tab]n", "<cmd>tabnext<CR>",  { silent = true })
vim.keymap.set("n", "[tab]p", "<cmd>tabprev<CR>",  { silent = true })
vim.keymap.set("n", "[tab]m", "<cmd>wincmd T<CR>",  { silent = true })
vim.keymap.set("n", "[tab]h", "<cmd>tabm -1<CR>",  { silent = true })
vim.keymap.set("n", "[tab]l", "<cmd>tabm +1<CR>",  { silent = true })
-- Finder
vim.keymap.set("n", "[sub]", "", { remap = false })
vim.keymap.set("n", "s", "[sub]", { remap = true })
vim.keymap.set("n", "[SUB]", "", { remap = false })
vim.keymap.set("n", "S", "[SUB]", { remap = true })
vim.keymap.set("n", "[sub]s", ":%s///gI<Left><Left><Left><Left>")
vim.keymap.set("n", "[sub]*", ":%s/<C-r>//gI<Left><Left><Left>")
vim.keymap.set("n", "[sub]n", "<cmd>bnext<CR>",  { silent = true })
vim.keymap.set("n", "[sub]p", "<cmd>bprev<CR>",  { silent = true })
vim.keymap.set("n", "[sub]l", "<cmd>FzfLua buffers<CR>",  { silent = true })
vim.keymap.set("n", "[sub]f", "<cmd>FzfLua files<CR>",  { silent = true })
vim.keymap.set("n", "[sub]g", '<cmd>FzfLua grep search=""<CR>',  { silent = true })
vim.keymap.set("n", "[sub]i", "<cmd>FzfLua changes<CR>",  { silent = true })
vim.keymap.set("n", "[sub]j", "<cmd>FzfLua jumps<CR>",  { silent = true })
vim.keymap.set("n", "[sub]m", "<cmd>FzfLua marks<CR>",  { silent = true })
vim.keymap.set("n", "[sub]r", "<cmd>FzfLua registers<CR>",  { silent = true })
vim.keymap.set("n", "[sub]d", "<cmd>FzfLua diagnostics_document<CR>",  { silent = true })
vim.keymap.set("n", "[sub]o", "<cmd>FzfLua lsp_document_symbols<CR>",  { silent = true })
vim.keymap.set("n", "[sub]t", "<cmd>FzfLua lsp_workspace_symbols<CR>",  { silent = true })
vim.keymap.set("n", "[sub].", "<cmd>FzfLua blines<CR>",  { silent = true })
vim.keymap.set("n", "[sub]/", "<cmd>FzfLua lines<CR>",  { silent = true })
vim.keymap.set("n", "[sub]y", "<cmd>FzfLua oldfiles<CR>",  { silent = true })
vim.keymap.set("n", "[sub]c", "<cmd>FzfLua command_history<CR>",  { silent = true })
vim.keymap.set("n", "[sub]q", "<cmd>FzfLua search_history<CR>",  { silent = true })
vim.keymap.set("n", "[sub]:", "<cmd>FzfLua commands<CR>",  { silent = true })
vim.keymap.set("n", "[sub]h", "<cmd>FzfLua helptags<CR>",  { silent = true })
vim.keymap.set("n", "[sub]?", "<cmd>FzfLua keymaps<CR>",  { silent = true })
-- LSP
vim.keymap.set("n", "[code]", "", { remap = false })
vim.keymap.set("n", "<Space>c", "[code]", { remap = true })
vim.keymap.set("n", "[code]?", "<cmd>FzfLua lsp_finer<CR>",  { silent = true })
vim.keymap.set("n", "[a", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true })
vim.keymap.set("n", "]a", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true })
vim.keymap.set("n", "<C-\\>", "<cmd>FzfLua lsp_references ignore_current_line=true includeDeclaration=false<CR>", { silent = true })
vim.keymap.set("n", "[code]i", "<cmd>FzfLua lsp_incoming_calls<CR>", { silent = true })
vim.keymap.set("n", "[code]o", "<cmd>FzfLua lsp_outgoing_calls<CR>", { silent = true })
vim.keymap.set("n", "[code]a", "<cmd>FzfLua lsp_code_actions<CR>",  { silent = true })
vim.keymap.set("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })
vim.keymap.set("v", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true })
vim.keymap.set("v", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true })
-- Git
vim.keymap.set("n", "[git]", "", { remap = false })
vim.keymap.set("n", "<Space>g", "[git]", { remap = true })
vim.keymap.set("n", "[git]s", "<cmd>Git<CR>",  { silent = true })
vim.keymap.set("n", "[git]d", "<cmd>Gvdiff<CR>",  { silent = true })
vim.keymap.set("n", "[git]m", "<cmd>GFiles?<CR>",  { silent = true })
vim.keymap.set("n", "[git]b", "<cmd>Git blame<CR>",  { silent = true })
vim.keymap.set("n", "[git]c", "<cmd>FzfLua git_bcommits<CR>",  { silent = true })
vim.keymap.set("n", "[git]l", "<cmd>FzfLua git_commits<CR>",  { silent = true })
vim.keymap.set("n", "[git]i", "<cmd>GitMessenger<CR>",  { silent = true })
vim.keymap.set("n", "[d", "<cmd>Gitsigns prev_hunk<CR>",  { silent = true })
vim.keymap.set("n", "]d", "<cmd>Gitsigns next_hunk<CR>",  { silent = true })
-- Misc
vim.keymap.set("n", "?", "<cmd>Lazy home<CR>",  { silent = true })
vim.keymap.set("n", "<Leader>e", "<cmd>Jaq<CR>",  { silent = true })
vim.keymap.set("n", "<Leader>s", "<cmd>SessionSelect<CR>",  { silent = true })
vim.keymap.set("n", "<Leader>d", "<cmd>SessionDelete<CR>",  { silent = true })
vim.keymap.set("n", "<Space>n", "<cmd>Neotree position=left toggle<CR>",  { silent = true })
vim.keymap.set("n", "<Space>v", "<cmd>Neotree document_symbols position=right toggle<CR>",  { silent = true })
vim.keymap.set("n", "<Space>u", "<cmd>MundoToggle<CR>",  { silent = true })
vim.keymap.set("n", "<Space>h", "<Plug>(quickhl-manual-this)", { remap = true, silent = true })
vim.keymap.set("n", "<Space>H", "<Plug>(quickhl-manual-reset)", { remap = true, silent = true })
vim.keymap.set("v", "<Space>h", "<Plug>(quickhl-manual-this)", { remap = true, silent = true })
vim.keymap.set("n", "n", "<Plug>(anzu-n-with-echo)", { remap = true, silent = true })
vim.keymap.set("n", "N", "<Plug>(anzu-N-with-echo)", { remap = true, silent = true })
vim.keymap.set("n", "*", "<Plug>(anzu-star-with-echo)", { remap = true, silent = true })
vim.keymap.set("n", "#", "<Plug>(anzu-sharp-with-echo)", { remap = true, silent = true })
vim.keymap.set("n", "<C-a>", "<Plug>(dial-increment)", { remap = true, silent = true })
vim.keymap.set("n", "<C-x>", "<Plug>(dial-decrement)", { remap = true, silent = true })
vim.keymap.set("n", "]b", "<Plug>(edgemotion-j)", { remap = true, silent = true })
vim.keymap.set("n", "[b", "<Plug>(edgemotion-k)", { remap = true, silent = true })
