return {
  {
    'junegunn/fzf',
    build = './install --bin'
  },
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'junegunn/fzf', 'nvim-tree/nvim-web-devicons' },
    -- binary dependencies:
    -- https://github.com/sharkdp/fd
    -- https://github.com/BurntSushi/ripgrep
    -- https://github.com/sharkdp/bat
    config = function()
      local actions = require("fzf-lua.actions")
      require("fzf-lua").setup({
        winopts = {
          preview = {
            layout = 'vertical'
          }
        },
        actions = {
          files = {
            true,
            ["ctrl-x"] = actions.file_split,
          },
        },
      })
    end
  },
}
