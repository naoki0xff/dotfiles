return {
  { 'osyo-manga/vim-anzu' },
  { 'haya14busa/vim-edgemotion' },
  { 'andymass/vim-tradewinds' },
  { 't9md/vim-quickhl' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  {
    'monaqa/dial.nvim',
    config = function()
      local augend = require('dial.augend')
      require('dial.config').augends:register_group{
        default = {
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.integer.alias.octal,
          augend.integer.alias.binary,
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.date.alias['%Y/%m/%d'],
          augend.date.alias['%Y/%m/%d'],
          augend.date.alias['%Y-%m-%d'],
          augend.date.alias['%m/%d'],
          augend.date.alias['%H:%M'],
        },
      }
    end,
  },
  {
    'editorconfig/editorconfig',
    config = function()
      vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
    end
  },
  {
    'simnalamburt/vim-mundo',
    config = function()
      vim.g.mundo_preview_buttom = 1
      vim.g.mundo_width = 35
      vim.g.mundo_preview_statusline = '[Undotree-preview]'
      vim.g.mundo_tree_statusline = '[Undotree]'
    end
  },
  {
    'olimorris/persisted.nvim',
    lazy = false,
    config = function()
      local persisted = require("persisted")
      local utils = require("persisted.utils")
      local allowed_dirs = {
        "~/work",
      }
      local ignored_buffers = {
        'help',
        'man',
        'neo-tree',
        'Mundo',
        'MundoDiff',
        'fugitive',
      }
      persisted.setup({
        autoload = true,
        autosave = true,
        follow_cwd = false,
        -- Start session when there's no previously saved one
        on_autoload_no_session = function()
          if utils.dirs_match(vim.fn.getcwd(), allowed_dirs) then
            vim.notify("Starting session for current buffer.")
          end
        end,
        -- Save session only on {allowed_dirs}
        should_save = function()
          return utils.dirs_match(vim.fn.getcwd(), allowed_dirs)
        end,
        -- Promise to close certain buffers before leaving session
        vim.api.nvim_create_autocmd("User", {
          pattern = "PersistedSavePre",
          callback = function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if (vim.tbl_contains(ignored_buffers, vim.bo[buf].filetype)) then
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
          end,
        }),
      })
    end,
    -- Do not start session when nvim started as manpager
    cond = function()
      return not(vim.tbl_contains(vim.v.argv, '+Man!'))
    end,
  },
  {
    'is0n/jaq-nvim',
    dependencies = { 'iamcco/markdown-preview.nvim' },
    config = function()
      require('jaq-nvim').setup({
        cmds = {
          internal = {
            lua = "luafile %",
            vim = "source %",
            markdown = "MarkdownPreview",
          },
          external = {
            sh = "sh %",
            go = "go run %",
            java = "java %",
            python = "python %",
            ruby = "ruby %",
          },
        },
        ui = {
          float = {
            border = "double",
            winblend = 15,
            height = 0.4,
            width = 0.6,
            x = 0.5,
            y = 0.3,
          },
        },
      })
    end
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app & yarn install',
    ft = { 'markdown' },
    config = function()
      vim.g.mkdp_filetype = { 'markdown' }
    end
  },
}
