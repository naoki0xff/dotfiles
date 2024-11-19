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

  -- Buffer
  -- N/A

  -- Tab
  -- Statusline
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
    config = function()
      -- Theme
      vim.g.airline_theme = 'base16_nord'
      -- Section
      -- Tabline
      vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
      vim.api.nvim_set_var('airline#extensions#tabline#show_tabs', 1)
      vim.api.nvim_set_var('airline#extensions#tabline#show_tab_count', 2)
      vim.api.nvim_set_var('airline#extensions#tabline#show_buffers', 0)
      vim.api.nvim_set_var('airline#extensions#tabline#show_splits', 0)
      vim.api.nvim_set_var('airline#extensions#tabline#show_splits', 0)
      vim.api.nvim_set_var('airline#extensions#tabline#tab_nr_type', 1)
      vim.api.nvim_set_var('airline#extensions#tabline#show_tab_nr', 1)
      vim.api.nvim_set_var('airline#extensions#hunks#non_zero_only', 1)
    end
  },

  -- Floating Filename
  {
    'b0o/incline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- depends https://www.nerdfonts.com
      'lewis6991/gitsigns.nvim'
    },
    config = function()
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
      
          return {
            { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
            { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
            { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
          }
        end,
      }
    end,
    event = 'VeryLazy',
  },
}

