# modules/nvim/default.nix
{ config, pkgs, lib, ... }:

{
  stylix.targets.neovim.enable = false;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
 };

 home.packages = with pkgs; [
    rustup
    trunk
    go
    nodejs
    gcc
    deno
 ];
}
