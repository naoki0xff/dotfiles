return {
  -- Colorscheme
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd[[colorscheme nord]]

      -- Example config in lua
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      -- Load the colorscheme
      require('nord').set()
    end,
  },

  -- File Explorer
  -- Buffer

  -- Statusline & Tab
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
    config = function()
      -- Theme
      vim.g.airline_theme = 'nord_minimal'
      -- Section
      vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
      -- Tabline
      vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
      vim.api.nvim_set_var('airline#extensions#tabline#show_tabs', 1)
      vim.api.nvim_set_var('airline#extensions#tabline#show_buffers', 0)
    end
  }
}

