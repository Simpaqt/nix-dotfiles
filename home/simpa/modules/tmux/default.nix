
{ config, pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPluginManager
      tmuxPluginFzf
      tmuxPluginFzfVim
      tmuxPluginFzfShell
      tmuxPluginFzfShellVim
    ];
    config = ''
      set -g default-terminal "screen-256color"
      set -g mouse on
      set -g history-limit 10000
    '';
  };
}
