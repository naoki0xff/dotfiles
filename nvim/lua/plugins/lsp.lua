return {
  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- List of server names
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      local servers = {
        'bashls',
        'dockerls',
        'helm_ls',
        'jdtls',
        'lemminx',
        'lua_ls',
        'nil_ls',
        'phpactor',
        'pyright',
        'terraformls',
        'ts_ls',
        'yamlls',
      }
      -- General configuration for each language server
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end
      -- Extra configuration for specific language server
      -- LUA: Enable LSP support for vim config files
      lspconfig.lua_ls.setup {
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
      lspconfig.yamlls.setup({
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
      })
    end
  },
  { 'towolf/vim-helm', ft = { 'helm'} },

  -- MISC
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  },
}
