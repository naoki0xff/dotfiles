-- Type `:call coc#util#install()` when executable is not correctly set up.
return { 
  {
    'neoclide/coc.nvim', 
    branch = 'release',
    init = function()
      -- install extensions
      vim.g.coc_global_extensions = { 
        'coc-explorer',
        'coc-lists',
        'coc-vimlsp',
        'coc-json',
        'coc-yaml',
        'coc-tsserver',
        'coc-go',
      }
    end
  },
  {
    {
      "williamboman/mason.nvim",
      dependencies = { 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig' }
    },
    {
      "williamboman/mason-lspconfig.nvim",
      init = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = {
            -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
            --"terraformls"
            -- "gopls",
            -- "ts_ls",
          }
        })
        require("mason-lspconfig").setup_handlers {
          function (server_name)
              require("lspconfig")[server_name].setup {}
          end,
        }
      end,
    },
    {
      "neovim/nvim-lspconfig",
    },
  },
}
