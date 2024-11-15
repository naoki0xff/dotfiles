return {
  {
    'tpope/vim-fugitive',
    init = function()
      vim.g.gitgutter_sign_modified_removed = '~'
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    init = function()
      require('gitsigns').setup()
    end
  },
  {
    'rhysd/git-messenger.vim',
    init = function()
      vim.g.git_messenger_no_default_mappings = 'v:true'
    end
  },
}
