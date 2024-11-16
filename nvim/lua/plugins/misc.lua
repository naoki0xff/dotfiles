return {
  { 'osyo-manga/vim-anzu' },
  { 'haya14busa/vim-edgemotion' },
  { 'andymass/vim-tradewinds' },
  { 't9md/vim-quickhl' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'cohama/lexima.vim' },
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
    'Yggdroot/indentLine',
    config = function()
      vim.g.indentLine_fileTypeExclude = { 'txt', 'text', 'help', 'man', 'fzf', 'json' }
      vim.g.vim_json_conceal = 0
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
      persisted.setup({
        autoload = true,
        autosave = true,
        follow_cwd = false,
        on_autoload_no_session = function()
          if utils.dirs_match(vim.fn.getcwd(), allowed_dirs) then
            vim.notify("Starting session for current buffer.")
          end
        end,
        should_save = function()
          return utils.dirs_match(vim.fn.getcwd(), allowed_dirs)
        end,
      })
    end,
  },
}
