# modules/nvim/default.nix
{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
 };

 home.packages = with pkgs; [
    rustup
    go
    nodejs
    deno
    gcc
 ];
}
