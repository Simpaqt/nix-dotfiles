return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Keep your other formatters_by_ft settings
      },
      formatters = {
        -- Use the Nix system-provided stylua instead of the Mason one
        stylua = {
          command = "stylua",  -- This will use the one from your NixOS PATH
          args = { "--indent-type", "Spaces", "--indent-width", "2", "--column-width", "120", "-" },
          
          -- If the above doesn't work, you can try with the full path:
          -- Use the actual path to stylua from your NixOS system
          -- Run "which stylua" in your terminal to find this path
          -- command = "/etc/profiles/per-user/simpa/bin/stylua",
        },
      },
      -- Keep any other conform.nvim configuration intact
    },
  },
  
  -- Add this section to prevent Mason from installing stylua
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Ensure opts.ensure_installed exists
      opts.ensure_installed = opts.ensure_installed or {}
      
      -- Remove stylua from ensure_installed if it's there
      for i, tool in ipairs(opts.ensure_installed) do
        if tool == "stylua" then
          table.remove(opts.ensure_installed, i)
          break
        end
      end
      
      return opts
    end,
  },
}
