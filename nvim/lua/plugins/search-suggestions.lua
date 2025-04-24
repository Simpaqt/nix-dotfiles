-- nvim/lua/plugins/search-suggestions.lua

return {
  -- Configure nvim-cmp for command line completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",  -- Add this if it's not already installed
    },
    opts = function(_, opts)
      -- Original nvim-cmp config is preserved

      -- Add cmdline completion for / and :
      local cmp = require("cmp")
      
      -- Command line setup for / search
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer', keyword_length = 1 }
        },
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          }),
        },
      })
      
      -- Command line setup for : commands
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          { { name = 'path' } },
          { { name = 'cmdline' } }
        ),
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          }),
        },
      })
      
      return opts
    end,
  },
  
  -- Make sure cmp-cmdline is installed
  {
    "hrsh7th/cmp-cmdline",
    lazy = false,  -- Critical: this needs to be loaded early
  }
}
