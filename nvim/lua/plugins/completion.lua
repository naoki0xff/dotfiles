return {
  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'windwp/nvim-autopairs',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local auto_select = true
      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noselect,preview"
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' },
          { name = 'vsnip' },
        }),
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          -- Completion mappings
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- Escape completion when <C-e> typed
          ['<C-e>'] = cmp.mapping(function(fallback)
            if cmp.get_active_entry() ~= nil then
              cmp.close()
            else
              fallback()
            end
          end),
          -- Snippet mappings
          ['<C-l>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand)", "")
              else
                cmp.confirm({ select = true })
              end
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<C-j>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#jumpable"](1) == 1 then
              feedkey("<Plug>(vsnip-jump-next)", "")
            end
          end, { "i", "s" }),
          ['<C-k>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<Plug>(vsnip-jump-prev)", "")
            end
          end, { "i", "s" }),
        },
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
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  { 'hrsh7th/vim-vsnip-integ' },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },
  { 'onsails/lspkind.nvim' },
}
