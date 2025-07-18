-- List of server names https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = {
  'bashls',
  "bicep",
  'dockerls',
  'gopls',
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

-- Default configuration for each language server
vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

-- Lua: Enable language server with filetype vim
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
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
})

-- Helm: capability configuration
vim.lsp.config('helm_ls', {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      }
    }
  }
})

-- YAML: Enable completion for various sources
vim.lsp.config('yamlls', {
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

-- Enable language servers
vim.lsp.enable(servers)

-- Enable diagnostics
vim.diagnostic.config({ virtual_text = true })
