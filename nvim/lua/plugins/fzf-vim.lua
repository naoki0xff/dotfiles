return {
  {
    'junegunn/fzf',
    build = './install --bin'
  },
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'junegunn/fzf', 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("fzf-lua").setup({
        winopts = {
          preview = {
            layout = 'vertical'
          }
        },
      })
    end
  },
}
