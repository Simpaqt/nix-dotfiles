{ config, pkgs, ... }:

{
 
  stylix.targets.qt.enable = true;
  home.packages = with pkgs; [
    vesktop
    kdePackages.dolphin
    teamspeak6-client
    teamspeak_server
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
