return {
  {
    'tpope/vim-fugitive',
    init = function()
      vim.g.gitgutter_sign_modified_removed = '~'
    end
  },
  {
    'airblade/vim-gitgutter',
  },
  {
    'rhysd/git-messenger.vim',
    init = function()
      vim.g.git_messenger_no_default_mappings = 'v:true'
    end
  },
}
