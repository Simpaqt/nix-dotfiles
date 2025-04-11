# modules/nvim/default.nix
{ config, pkgs, lib, ... }:

{
  
  home.file.".config/nvim" = {
    source = ../../../../../.config/nvim;
    recursive = true;
  };

  stylix.targets.neovim.enable = false;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
 };
 # programs.nixvim = {
 #    enable = true;
 #    defaultEditor = true;
 #    colorschemes.tokyonight.enable = true;
 #    plugins.lualine.enable = true;
 #    plugins.mini.enable = true;
 #
 #  };

 home.packages = with pkgs; [
    rustup
    delve
    vscode-extensions.vadimcn.vscode-lldb
    lua-language-server
    stylua
    zig
    zls
    trunk
    go
    python3
    nodejs
    gcc
    deno
 ];
} 
