return {
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup({
        on_attach = function(bufnr)
          vim.keymap.set("n", "[c", function() if vim.wo.diff then vim.cmd.normal({'[c', bang = true}) else gitsigns.nav_hunk('prev') end end)
          vim.keymap.set("n", "]c", function() if vim.wo.diff then vim.cmd.normal({']c', bang = true}) else gitsigns.nav_hunk('next') end end)
        end
      })
    end
  },
  {
    'rhysd/git-messenger.vim',
    config = function()
      vim.g.git_messenger_no_default_mappings = true
      vim.g.git_messenger_always_into_popup = true
      vim.g.git_messenger_floating_win_opts = { border = 'single' }
      vim.g.git_messenger_popup_content_margins = false
    end
  },
}
