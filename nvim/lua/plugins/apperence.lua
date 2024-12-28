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

  -- Tabline & Statusline
  -- TODO: 絶妙に気に食わない。tablineのカラースキームがビミョいのと、tabのファイル名がactive bufferと一致しない。
  --  => bufferlineはなんかtablineのスタイルが崩れてる。環境依存感。そこはthemeがダサいのと釣り合いとれてる？あとあれだ。tabnrがbufferlineだと出し方がわからない。
  --  => lualine as statusline + bufferline as tablineが良さそうだけど、なんか襷に短し系統。diagnosticsはinclineにまとめたいので、statuslineには要らないわ。
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes', 'SmiteshP/nvim-navic' },
    config = function()
      -- Theme
      vim.g.airline_theme = 'base16_nord'
      -- Section
      vim.g.airline_section_c = "%{%v:lua.require'nvim-navic'.get_location()%}"
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

  -- Winbar
  {
    'b0o/incline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local function get_diagnostic_label(props)
          local icons = {
              Error = "",
              Warn = "",
              Info = "",
              Hint = "",
          }
          local label = {}
          for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, {severity = vim.diagnostic.severity[string.upper(severity)]})
              if n > 0 then
                  local fg = "#" .. string.format("%06x", vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)["foreground"])
                  table.insert(label, {icon .. " " .. n .. " ", guifg = fg})
              end
          end
          return label
      end
      require("incline").setup({
        debounce_threshold = { falling = 500, rising = 250 },
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":t")
          local diagnostics = get_diagnostic_label(props)
          local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
          local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)
          local buffer = {
              { filetype_icon, guifg = color },
              { " " },
              { filename, gui = modified },
          }
          if #diagnostics > 0 then
              table.insert(diagnostics, { "| ", guifg = "grey" })
          end
          for _, buffer_ in ipairs(buffer) do
              table.insert(diagnostics, buffer_)
          end
          return diagnostics
        end,
      })
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
        depth_limit = 5,
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

