{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4"; # Super key
      terminal = "ghostty";
      menu = "wofi --show drun";
      fonts = {
        names = ["JetBrains Mono"];
        size = lib.mkForce 11.0;
      };
      bars = [{
        command = "waybar";
      }];
      input = {
        "type:keyboard" = {
          xkb_layout = "us,no";
          xkb_options = "grp:win_space_toggle";
        };
      };
      output = {
        "DP-2" = {
          mode = "1920x1080@144Hz";
          position = "0,0";
        };
        "HDMI-A-1" = {
          mode = "1920x1080@60Hz";
          position = "1920,0";
        };
      };
      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in {
        "${modifier}+Return" = "exec ${config.wayland.windowManager.sway.config.terminal}";
        "${modifier}+q" = "kill";
        "${modifier}+a" = "exec ${config.wayland.windowManager.sway.config.menu}";
        "${modifier}+e" = "exec dolphin";
        "${modifier}+f" = "exec vivaldi";
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'Exit Sway?' -b 'Yes' 'swaymsg exit'";
        
        # Focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        
        # Move
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        
        # Workspaces
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";
        
        # Move to workspace
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";
        
        # Layout
        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+t" = "layout toggle split";
        "Alt+Return" = "fullscreen";
        "${modifier}+space" = "floating toggle";
        
        # Screenshot
        "${modifier}+p" = "exec grimblast copysave area";
        "${modifier}+Shift+p" = "exec grimblast copysave output";
      };
      
      gaps = {
        inner = 5;
        outer = 10;
      };
      
      window = {
        border = 2;
        titlebar = false;
      };
    };
    
    extraConfig = ''
      # Set wallpaper
      output * bg ${home/simpa/Downloads/fox.png} fill
      
      # Font for window titles (if titlebars are enabled)
      font pango:JetBrains Mono 11
      
      # You can add more custom configuration here
    '';
  };
  
  # Add necessary packages for Sway
  home.packages = with pkgs; [
    swaylock
    swayidle
    wl-clipboard
    mako # notification daemon
    wofi # app launcher
    grim
    slurp
    jq
    grimblast
    jetbrains-mono # Add JetBrains Mono font
  ];
}
