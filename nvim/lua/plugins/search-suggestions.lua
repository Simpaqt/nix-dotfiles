-- nvim/lua/plugins/search-suggestions.lua

return {
  -- Configure nvim-cmp for command line completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",  -- For command-line completion
      "hrsh7th/cmp-buffer",   -- For buffer content completion in search
      "hrsh7th/cmp-path",     -- For path completion in command mode
    },
    config = function(_, _)
      local cmp = require("cmp")
      
      -- Keep the original configuration for insert mode
      -- The error is happening because we're not properly preserving the original setup
      
      -- Set up cmdline completion for / (search)
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        },
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          }),
        }
      })
      
      -- Set up cmdline completion for : (commands)
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
        }
      })
    end,
  },
  
  -- Make sure the required completion sources are installed
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
}
