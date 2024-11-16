return { 
  {
    'junegunn/fzf.vim',
    dependencies = 'junegunn/fzf',
    config = function()
      vim.g.fzf_tag_command = 'ctags -R -f .tags'
  end
  },
}
