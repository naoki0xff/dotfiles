return {
  -- LSP
  {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig' }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
          'terraformls',
          'dockerls',
          "gopls",
          'ts_ls',
          -- 'java_language_server',
          'lua_ls',
        }
      })
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
          }
        end,
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
  },

  -- Formatter
  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = { 'williamboman/mason.nvim', 'nvimtools/none-ls.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mason').setup()
      require('mason-null-ls').setup({
        ensure_installed = {
          -- https://github.com/jay-babu/mason-null-ls.nvim/blob/main/lua/mason-null-ls/mappings/filetype.lua
          'goimports',
          'stylua',
        },
        handlers = {},
      })
      local status, null_ls = pcall(require, 'null-ls') -- 'null_ls' is same as 'none_ls'
      if not status then
        return
      end
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.stylua,
        }
      })
    end
  },
  {
    'nvimtools/none-ls.nvim',
  },

  -- MISC
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  },
}
