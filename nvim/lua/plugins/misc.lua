return {
  { 'osyo-manga/vim-anzu' },
  { 'osyo-manga/vim-trip' },
  { 'haya14busa/vim-edgemotion' },
  { 'andymass/vim-tradewinds' },
  { 't9md/vim-quickhl' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-speeddating' },
  { 'cohama/lexima.vim' },
  { 'editorconfig/editorconfig',
    init = function()
      vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
    end
  },
  { 'Yggdroot/indentLine',
    init = function()
      vim.g.indentLine_fileTypeExclude = { 'txt', 'text', 'help', 'man', 'fzf', 'json' }
      vim.g.vim_json_conceal = 0
    end
  },
  { 'simnalamburt/vim-mundo',
    init = function()
      vim.g.mundo_preview_buttom = 1
      vim.g.mundo_width = 35
      vim.g.mundo_preview_statusline = '[Undotree-preview]'
      vim.g.mundo_tree_statusline = '[Undotree]'
    end
  },
}
