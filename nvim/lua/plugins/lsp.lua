return {
  -- LSP
  {
    'williamboman/mason.nvim',
    dependencies = { 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig' }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp', 'towolf/vim-helm' },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
          'bashls',
          'dockerls',
          'gopls',
          'helm_ls',
          'jdtls',
          'lemminx',
          'lua_ls',
          'nil_ls',
          'terraformls',
          'ts_ls',
          'yamlls',
        }
      })
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
          }
          -- Extra Configuration for each language server
          -- LUA: Enable LSP support for vim config files
          require'lspconfig'.lua_ls.setup {
            on_init = function(client)
              if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
                  return
                end
              end
              client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                  version = 'LuaJIT'
                },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME
                  }
                }
              })
            end,
            settings = {
              Lua = {}
            }
          }
          -- YAML: Enable completion for various sources
          require('lspconfig').yamlls.setup {
            settings = {
              yaml = {
                schemaStore = {
                  enable = true,
                },
                schemas = {
                  ["kubernetes"] = "/*.yaml",
                  ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                  ["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                  ["https://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                  ["https://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                  ["https://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                  ["https://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                  ["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                  ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                  ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}"
                },
              },
            },
          }
        end,
      }
    end,
  },
  { 'neovim/nvim-lspconfig' },
  { 'towolf/vim-helm', ft = { 'helm'} },

  -- Formatter
  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = { 'williamboman/mason.nvim', 'nvimtools/none-ls.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- https://github.com/jay-babu/mason-null-ls.nvim/blob/main/lua/mason-null-ls/mappings/filetype.lua
      local enabled_formatter = { 'goimports', 'stylua' }
      require('mason').setup()
      require('mason-null-ls').setup({
        ensure_installed = enabled_formatter,
        handlers = {},
      })
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          -- TODO: なんかいい感じで。ensure_installedのリストと重複してるからええかんじに一回書くだけで動くように。
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.stylua,
        }
      })
    end
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- MISC
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  },
}
