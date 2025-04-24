-- ~/.config/nvim/lua/plugins/search-suggestions.lua

return {
  -- Core nvim-cmp setup
  {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      'hrsh7th/cmp-buffer',   -- Buffer source for completions
      'hrsh7th/cmp-path',     -- Path completions
      'hrsh7th/cmp-cmdline',  -- Command line completions
    },
    config = function()
      local cmp = require('cmp')
      -- Global setup
      cmp.setup({
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 'c' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 'c' }),
        }),
        sources = cmp.config.sources({
          { name = 'buffer' },
          { name = 'path' },
        }),
        experimental = {
          ghost_text = true,
        },
      })
      -- Add specific `/` search cmdline setup
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer', keyword_length = 2 }  -- Show suggestions after 2 chars
        },
        view = {
          entries = { name = 'wildmenu', separator = ' | ' }
        },
      })
      -- Command line setup for `:` commands
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {
            { name = 'path' }
          },
          {
            { name = 'cmdline', keyword_length = 2 }
          }
        ),
        view = {
          entries = { name = 'custom', selection_order = 'near_cursor' }
        },
      })
    end,
  },
  -- Add any additional plugins you might need
  {
    'nvim-lua/plenary.nvim',  -- Common dependency
  },
}
