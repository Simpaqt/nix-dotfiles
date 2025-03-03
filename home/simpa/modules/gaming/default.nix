{ pkgs, lib, ... }:
{

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
