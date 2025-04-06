# modules/nvim/default.nix
{ config, pkgs, lib, ... }:

{
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
    trunk
    go
    python3
    nodejs
    gcc
    deno
 ];
} 
