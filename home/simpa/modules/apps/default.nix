{ config, pkgs, ... }:

{
 
  stylix.targets.qt.enable = true;
  home.packages = with pkgs; [
    vesktop
    kdePackages.dolphin
    godot
    spotube
    spotify
    protonup-qt
    google-chrome
    figma-linux
    thunderbird
    vivaldi
  ];
}
