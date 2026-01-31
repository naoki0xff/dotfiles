return {
  -- Icons
  { 'nvim-tree/nvim-web-devicons' },
  -- Depends on: https://www.nerdfonts.com
  -- Search icons: https://www.nerdfonts.com/cheat-sheet

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
    end,
    event = 'VeryLazy',
  },

  -- Indent Guide
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require('ibl').setup({
        exclude = {
          filetypes = {
            'neo-tree',
          },
        },
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
    end,
    event = 'VeryLazy',
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
        sections = {
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'navic' },
          lualine_x = { { 'lsp_status', icon = '󰧑', symbols = { separator = '  ', done = '' }, }, },
          lualine_y = { 'encoding', 'fileformat', 'filetype' },
          lualine_z = { 'location', 'progress' },
        },
        extensions = {
          'fugitive',
          'fzf',
          'lazy',
          'man',
          'neo-tree',
          'quickfix',
        }
      })
    end
  },

  -- Winbar
  {
    'b0o/incline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local function get_diagnostic_label()
            local icons = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
            local label = {}
            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { '┊ ' })
            end
            return label
          end
          return {
            { get_diagnostic_label() },
            { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
            { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
            { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
          }
        end,
      }
    end,
    event = 'VeryLazy',
  },

  -- LSP
  -- Show parent-child structure
  {
    'SmiteshP/nvim-navic',
    config = function()
      require('nvim-navic').setup({
        lsp = {
          auto_attach = true,
        },
        click = true,
      })
    end,
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
    end,
    event = 'VeryLazy',
  },
  -- Show LSP progress message
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  },
}

