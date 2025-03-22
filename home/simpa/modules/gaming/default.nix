{ pkgs, lib, ... }:
{

  home.packages = with pkgs; [
    lutris
    wine
    protonup-qt
    wowup-cf
    prismlauncher
    smassh
    gamemode
  ];
}
