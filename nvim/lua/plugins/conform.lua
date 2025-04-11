return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        -- Override stylua configuration to use Nix-provided binary
        stylua = {
          command = "stylua",  -- This will use the one in your PATH from Nix
          -- Alternatively, use the full path if needed:
          -- command = "/etc/profiles/per-user/simpa/bin/stylua",
        },
      },
      -- Keep the rest of your conform.nvim configuration intact
    },
  },
}
