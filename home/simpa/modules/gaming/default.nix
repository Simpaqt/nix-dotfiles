{ pkgs, lib, ... }:
{

  home.packages = with pkgs; [
    lutris
    wine
    protonup-qt
    power-profiles-daemon
    wowup-cf
    prismlauncher
    smassh
  ];
}
