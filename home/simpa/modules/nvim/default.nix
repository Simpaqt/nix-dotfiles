# home/simpa/modules/nvim/nixvim.nix
{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    # Theme settings
    config = {
      enable = true;
    # Global options
      colorschemes.tokyonight.enable = true;
      globals = {
        mapleader = " ";
        maplocalleader = " ";
        loaded_netrwPlugin = 1;
      };
      
      # General options
      options = {
        number = true;
        relativenumber = true;
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        wrap = false;
        ignorecase = true;
        smartcase = true;
        termguicolors = true;
        undofile = true;
        updatetime = 250;
        timeoutlen = 300;
        clipboard = "unnamedplus";
      };
      
      # Main plugins
      plugins = {
        # UI plugins
        alpha = {
          enable = true;
          theme = "dashboard";
          iconsEnabled = true;
          opts = ''
            function()
              local dashboard = require("alpha.themes.dashboard")
              local logo = [[
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠿⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡟⠀⢀⡆⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⠅⠀⠀⠀⠀⢀⡄⠀⠀⠀⣿⣿⣿⣗⣠⣾⡇⠀⠀⠀⠀⢠⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⢸⣆⠀⠀⢰⣿⣿⣿⣿⣿⣯⠀⢀⣴⠆⠀⠻⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀

              WAKE THE FUCK UP SAMURAI

              ]]

              dashboard.section.header.val = vim.split(logo, "\n")
              dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
                dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
                dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
                dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
                dashboard.button("c", " " .. " Config",          "<cmd> Telescope find_files cwd=~/.config/nixvim <cr>"),
                dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
                dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
                dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
              }
              
              return dashboard
            end
          '';
        };

        bufferline.enable = true;
        lualine.enable = true;
        noice.enable = true;
        which-key.enable = true;
        
        # Editor plugins
        mini = {
          enable = true;
          modules = {
            ai = {};
            pairs = {};
            surround = {};
            move = {};
            files = {};
            hipatterns = {};
          };
        };
        
        # Completions and IDE features
        cmp-buffer.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp-path.enable = true;
        nvim-cmp = {
          enable = true;
          snippet.expand = "luasnip";
          sources = [
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = {
              action = ''
                function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  else
                    fallback()
                  end
                end
              '';
            };
          };
        };
        
        # Navigation and search
        flash.enable = true;
        telescope = {
          enable = true;
          defaults = {
            layout_strategy = "horizontal";
            layout_config = {
              prompt_position = "top";
            };
            sorting_strategy = "ascending";
            winblend = 0;
          };
          keymaps = {
            "<leader>ff" = "find_files";
            "<leader>fg" = "live_grep";
            "<leader>fb" = "buffers";
            "<leader>fh" = "help_tags";
            "<leader>fr" = "oldfiles";
          };
        };
        
        # Git integration
        neogit = {
          enable = true;
          settings = {
            integrations = {
              diffview = true;
            };
          };
        };
        gitsigns.enable = true;
        
        # File explorer
        oil = {
          enable = true;
          settings = {
            columns = ["icon" "name" "size" "mtime"];
            view_options = {
              show_hidden = true;
            };
          };
        };
        
        # Language plugins
        treesitter = {
          enable = true;
          ensureInstalled = [
            "bash"
            "c"
            "html"
            "javascript"
            "json"
            "lua"
            "markdown"
            "nix"
            "python"
            "rust"
            "typescript"
            "tsx"
            "toml"
            "yaml"
            "gdscript"
            "go"
            "svelte"
            "vue"
          ];
          incrementalSelection.enable = true;
          textobjects.enable = true;
        };
        
        ts-autotag.enable = true;
        
        # LSP configuration
        lsp = {
          enable = true;
          servers = {
            lua-ls = {
              enable = true;
              settings.telemetry.enable = false;
            };
            gopls.enable = true;
            rust-analyzer = {
              enable = true;
              settings = {
                checkOnSave = true;
                check = {
                  command = "clippy";
                };
              };
            };
            tsserver.enable = true;
            pyright.enable = true;
            nil_ls.enable = true;
            gdscript.enable = true;
            tailwindcss.enable = true;
            svelte.enable = true;
            volar.enable = true;
          };
          keymaps = {
            diagnostic = {
              "<leader>cd" = "open_float";
              "[d" = "goto_prev";
              "]d" = "goto_next";
            };
            lspBuf = {
              "gD" = "declaration";
              "gd" = "definition";
              "K" = "hover";
              "gi" = "implementation";
              "<leader>ca" = "code_action";
              "<leader>cr" = "rename";
              "<leader>cf" = "format";
            };
          };
        };
        
        # Formatters
        conform-nvim = {
          enable = true;
          formatOnSave = {
            lspFallback = true;
            timeoutMs = 500;
          };
          formattersByFt = {
            lua = ["stylua"];
            rust = ["rustfmt"];
            go = ["gofmt"];
            nix = ["nixfmt"];
            javascript = ["prettier"];
            typescript = ["prettier"];
            json = ["prettier"];
            html = ["prettier"];
            css = ["prettier"];
            yaml = ["prettier"];
          };
        };
        
        # Todo comments
        todo-comments.enable = true;
        
        # Persistence (session management)
        persistence = {
          enable = true;
          dir = "${config.xdg.dataHome}/nvim/sessions";
        };
        
        # Debugging
        dap = {
          enable = true;
          extensions = {
            dap-ui.enable = true;
            dap-virtual-text.enable = true;
          };
        };
        
        # Additional plugins
        transparent.enable = true;
        markdown-preview.enable = true;
        trouble.enable = true;
        harpoon.enable = true;
      };
      
      # Extra lua configuration
      extraConfigLua = ''
        -- Additional configuration that's harder to express in Nix
        
        -- Harpoon configuration
        local harpoon = require("harpoon")
        harpoon:setup()
        
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add file to Harpoon" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon menu" })
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon buffer 1" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon buffer 2" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon buffer 3" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon buffer 4" })
        
        -- Add custom keymaps
        -- File explorer
        vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open file explorer" })
        
        -- Window management
        vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
        vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split window horizontally" })
        
        -- Buffer navigation
        vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
        vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
        vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
        
        -- Clear search highlighting
        vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })
        
        -- Save and exit shortcuts
        vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
        vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
        vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and quit" })
        
        -- Telescope additional keymaps
        local telescope = require("telescope.builtin")
        vim.keymap.set("n", "<leader>fs", function() telescope.grep_string() end, { desc = "Find string under cursor" })
        vim.keymap.set("n", "<leader>fc", function() telescope.current_buffer_fuzzy_find() end, { desc = "Find in current buffer" })
        
        -- Git commands
        vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
        vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
        vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
        
        -- Custom diagnostic settings
        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true,
        })
        
        -- Autocommands
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "nix" },
          callback = function()
            vim.opt_local.tabstop = 2
            vim.opt_local.shiftwidth = 2
          end,
        })
        
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "go" },
          callback = function()
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4
            vim.opt_local.expandtab = false
          end,
        })
      '';
      
      # Keymaps
      keymaps = [
        # General keymaps
        {
          key = "<Esc>";
          action = "<cmd>noh<CR>";
          mode = "n";
          options = {
            desc = "Clear highlights";
            silent = true;
          };
        }
        
        # Window navigation
        {
          key = "<C-h>";
          action = "<C-w>h";
          mode = "n";
          options = {
            desc = "Go to left window";
            silent = true;
          };
        }
        {
          key = "<C-j>";
          action = "<C-w>j";
          mode = "n";
          options = {
            desc = "Go to lower window";
            silent = true;
          };
        }
        {
          key = "<C-k>";
          action = "<C-w>k";
          mode = "n";
          options = {
            desc = "Go to upper window";
            silent = true;
          };
        }
        {
          key = "<C-l>";
          action = "<C-w>l";
          mode = "n";
          options = {
            desc = "Go to right window";
            silent = true;
          };
        }
        
        # Resize with arrows
        {
          key = "<C-Up>";
          action = "<cmd>resize +2<CR>";
          mode = "n";
          options = {
            desc = "Increase window height";
            silent = true;
          };
        }
        {
          key = "<C-Down>";
          action = "<cmd>resize -2<CR>";
          mode = "n";
          options = {
            desc = "Decrease window height";
            silent = true;
          };
        }
        {
          key = "<C-Left>";
          action = "<cmd>vertical resize -2<CR>";
          mode = "n";
          options = {
            desc = "Decrease window width";
            silent = true;
          };
        }
        {
          key = "<C-Right>";
          action = "<cmd>vertical resize +2<CR>";
          mode = "n";
          options = {
            desc = "Increase window width";
            silent = true;
          };
        }
      ];
    };
  };
    
  
  # Install required packages for nixvim to work properly
  home.packages = with pkgs; [
    # Languages and language servers
    rustup                             # Rust toolchain manager
    delve                              # Go debugger
    lua-language-server                # Lua LSP
    stylua                             # Lua formatter
    zig                                # Zig programming language
    zls                                # Zig language server
    trunk                              # Web application bundler for Rust
    go                                 # Go programming language
    gopls                              # Go language server
    python3                            # Python 
    nodePackages.pyright               # Python language server
    nodejs                             # Node.js
    nodePackages.typescript-language-server  # TypeScript language server
    nodePackages.svelte-language-server      # Svelte language server
    nodePackages.volar                       # Vue language server
    nodePackages.prettier                    # Code formatter
    gcc                                      # C/C++ compiler
    deno                                     # JavaScript/TypeScript runtime
    nixpkgs-fmt                              # Nix formatter
    nil                                      # Nix language server
    ripgrep                                  # Used by telescope for searching
    fd                                       # Alternative to find, used by telescope
    gdb                                      # GNU debugger for C/C++
    
    # Additional tools
    fzf                                # Fuzzy finder
    git                                # Git version control
  ];
  
  # Set up stylix integration if using stylix elsewhere
  stylix.targets.neovim.enable = false;
}
