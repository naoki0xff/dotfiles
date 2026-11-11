return {
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup({
        -- options
        word_diff = true,
        -- keymap
        on_attach = function(bufnr)
          vim.keymap.set("n", "[c", function() if vim.wo.diff then vim.cmd.normal({'[c', bang = true}) else gitsigns.nav_hunk('prev') end end)
          vim.keymap.set("n", "]c", function() if vim.wo.diff then vim.cmd.normal({']c', bang = true}) else gitsigns.nav_hunk('next') end end)
        end,
      })
      local function set_word_diff_highlights()
        vim.api.nvim_set_hl(0, 'GitSignsAddLnInline', { bg = '#3B514D' })
        vim.api.nvim_set_hl(0, 'GitSignsChangeLnInline', { bg = '#3B5066' })
        vim.api.nvim_set_hl(0, 'GitSignsDeleteLnInline', { bg = '#5B3B45' })
      end

      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('GitsignsWordDiffHighlights', { clear = true }),
        callback = set_word_diff_highlights,
      })
      set_word_diff_highlights()
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
