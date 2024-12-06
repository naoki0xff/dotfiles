return {
  {
    'tpope/vim-fugitive',
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
