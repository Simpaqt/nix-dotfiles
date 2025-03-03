{ pkgs, lib, pkgs, ... }:
{

  programs.steam.enable = true;
  home.packages = with pkgs; [
    lutris
    gamemode
    wine
    protonup-qt
    wowup-cf
    prismlauncher
    smassh
  ];
}
