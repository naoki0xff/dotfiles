-- Type `:call coc#util#install()` when executable is not correctly set up.
return { 
  {
    'neoclide/coc.nvim', 
    branch = 'release',
    init = function()
      vim.g.coc_global_extensions = { 
        'coc-explorer',
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
      --init = function()
      --  require("mason").setup()
      --  require("mason-lspconfig").setup({})
      --  require("mason-lspconfig").setup_handlers {
      --    function (server_name)
      --        require("lspconfig")[server_name].setup {}
      --    end,
      --    -- See LSP mappings => https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
      --    ["terraformls"] = function ()
      --      require("terraformls").setup {}
      --    end
      --  }
      --end,
    },
    {
      "neovim/nvim-lspconfig",
    },
  },
}
-- TODO: manage lsp here
