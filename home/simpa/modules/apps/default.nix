{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vesktop
    spotify
    protonup-qt
    google-chrome
  ];
}
