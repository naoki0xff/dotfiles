local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_ft_with_q"),
  pattern = {
    "help",
    "diff",
    "ref*",
    "preview",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- close some buffer types with <q>
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("close_buf_with_q"),
  pattern = {
    "fugitive://*",
    "*.fugitiveblame",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- show vim help with vim/help/lua files, otherwise show documentation of current symbol from lsp
vim.api.nvim_create_autocmd('BufEnter', {
  group = augroup("vim_documentation"),
  pattern = '*',
  callback = function ()
      if (vim.tbl_contains({
        'vim',
        'help',
        'lua'
      }, vim.o.filetype)) then
        vim.opt_local.keywordprg = ":help"
      else
        vim.api.nvim_buf_set_keymap(0, "n", "K", ":lua vim.lsp.buf.hover()<CR>", { silent = true })
      end
  end
})
