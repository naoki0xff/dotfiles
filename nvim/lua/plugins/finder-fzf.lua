return {
  {
    'junegunn/fzf',
    build = './install --bin'
  },
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'junegunn/fzf', 'nvim-tree/nvim-web-devicons' },
    -- External dependencies:
    -- https://github.com/sharkdp/fd
    -- https://github.com/BurntSushi/ripgrep
    -- https://github.com/sharkdp/bat
    config = function()
      local actions = require("fzf-lua.actions")
      require("fzf-lua").setup({
        'fzf-tmux',
        file_icon_padding = ' ',
        winopts = {
          preview = {
            layout = 'horizontal',
            horizontal = 'right:50%',
          },
        },
        actions = {
          files = {
            true,
            ["ctrl-x"] = actions.file_split,
          },
        },
        fzf_colors = {
          true,
        }
      })
    end
  },
}
