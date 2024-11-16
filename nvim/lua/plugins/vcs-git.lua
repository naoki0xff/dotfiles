return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.g.gitgutter_sign_modified_removed = '~'
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'rhysd/git-messenger.vim',
    config = function()
      vim.g.git_messenger_no_default_mappings = 'v:true'
    end
  },
}
