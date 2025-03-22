{ config, pkgs, ... }:

{
 
  home.packages = with pkgs; [
    vesktop
    spotube
    spotify
    protonup-qt
    google-chrome
    figma-linux
    vivaldi
  ];
}
