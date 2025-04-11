return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configure lua_ls to use the Nix-provided binary
        lua_ls = {
          -- Prevent Mason from managing this server
          mason = false,
          -- Use the Nix-provided binary
          cmd = { "/etc/profiles/per-user/simpa/bin/lua-language-server" },
        },
        -- Remove any reference to "stylua" here if it exists
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Exclude lua_ls from automatic installation
      opts.automatic_installation = opts.automatic_installation or {}
      opts.automatic_installation.exclude = opts.automatic_installation.exclude or {}
      table.insert(opts.automatic_installation.exclude, "lua_ls")
      
      -- Make sure stylua is not in the list of LSP servers
      if opts.ensure_installed then
        for i, server in ipairs(opts.ensure_installed) do
          if server == "stylua" then
            table.remove(opts.ensure_installed, i)
            break
          end
        end
      end
    end,
  },
}
