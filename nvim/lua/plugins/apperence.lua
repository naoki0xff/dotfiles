return {
  -- Icons
  { 'nvim-tree/nvim-web-devicons' }, -- Depends on https://www.nerdfonts.com

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

  -- Explorer & Document Symbols
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup({
        sources = {
          -- Enable Explorer
          'filesystem',
          -- Enable document_symbols
          'document_symbols',
        }
      })
    end
  },

  -- Indent Guide
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require('ibl').setup({
        indent = {
          char = "|",
          tab_char = "|",
        },
        scope = {
          enabled = false,
        },
      })
      local hooks = require('ibl.hooks')
      hooks.register(
        hooks.type.WHITESPACE,
        hooks.builtin.hide_first_space_indent_level
      )
      hooks.register(
        hooks.type.WHITESPACE,
        hooks.builtin.hide_first_tab_indent_level
      )
    end
  },

  -- Tabline
  {
    'crispgm/nvim-tabline',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.opt.showtabline = 2
      require('tabline').setup({
        show_index = true,
        show_modify = true,
        show_icon = true,
        brackets = { '', '' },
      })
    end
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'nord',
          always_show_tabline = false,
        },
        extensions = {
          'fugitive',
          'fzf',
          'lazy',
          'man',
          'mason',
          'neo-tree',
          'quickfix',
        }
      })
    end
  },

  -- Winbar
  {
    'b0o/incline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic' },
    config = function()
      local helpers = require 'incline.helpers'
      local navic = require 'nvim-navic'
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local res = {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            guibg = '#44406e',
          }
          if props.focused then
            for _, item in ipairs(navic.get_data(props.buf) or {}) do
              table.insert(res, {
                { ' > ', group = 'NavicSeparator' },
                { item.icon, group = 'NavicIcons' .. item.type },
                { item.name, group = 'NavicText' },
              })
            end
          end
          table.insert(res, ' ')
          return res
        end,
      }
    end,
    event = 'VeryLazy',
  },

  -- LSP
  -- Show parent-child structure
  {
    'SmiteshP/nvim-navic',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      require('nvim-navic').setup({
        lsp = {
          auto_attach = true,
        },
        highlight = true,
      })
    end
  },
  -- Show scope
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesitter-context').setup({
        enable = true,
        multiwindow = true,
        max_lines = 1,
      })
    end
  }
}

