return {
  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'cmp-nvim-lsp',
      'cmp-buffer',
      'cmp-path',
      'cmp-cmdline',
      'PhilippFeO/cmp-help-tags',
      'lspkind.nvim',
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local auto_select = true
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noselect"
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' },
        }),
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        }),
        -- TODO: when typing <C-e>, which mapped to <C-o>$, you need to type twice to escape from completion menu select mode.
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = {
              menu = 50,
              abbr = 50,
            },
            ellipsis_char = '...',
            show_labelDetails = true,
          })
        },
      })
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        }
      })
      cmp.setup.cmdline({ ':' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'cmdline' },
          { name = 'path' },
        },
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'onsails/lspkind.nvim' },
}
