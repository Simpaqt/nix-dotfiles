{config, pkgs, lib, ...}:
{
  programs.nixvim = {
     enable = true;
     defaultEditor = true;
     colorschemes.tokyonight.enable = true;
     plugins = {
      alpha.enable = true;
      bufferline.enable = true;
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      conform-nvim.enable = true;
      flash.enable = true;
      lazy.enable = true;
      lazydev.enable = true;
      lualine.enable = true;
      mini.enable = true;
      noice.enable = true;
      which-key.enable = true;

    };

   };
}
