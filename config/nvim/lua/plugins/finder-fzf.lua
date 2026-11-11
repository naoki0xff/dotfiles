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
        'fzf-native',
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
        git = {
          commits = {
            actions = {
              ["enter"] = function(selected, opts)
                if not selected[1] then return end
                local sha = selected[1]:match("^%S+")
                local result = vim.system({ "git", "show", "--no-color", sha }, {
                  cwd = opts.cwd,
                  text = true,
                }):wait()

                if result.code ~= 0 then
                  vim.notify(result.stderr, vim.log.levels.ERROR)
                  return
                end

                local buf = vim.api.nvim_create_buf(false, true)
                vim.api.nvim_buf_set_lines(
                  buf, 0, -1, false, vim.split(result.stdout, "\n")
                )
                vim.bo[buf].filetype = "git"
                vim.bo[buf].modifiable = false
                vim.api.nvim_win_set_buf(0, buf)
              end,
            },
          },
        },
      })
    end
  },
}
