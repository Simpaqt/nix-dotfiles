{ config, pkgs, inputs, ... }:

{
  # Your existing home-manager config...


  # Hyprland config
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
    "$mod" = "SUPER";
      # Example configuration
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee)";
        "col.inactive_border" = "rgba(595959aa)";
      };

      decoration = {
        rounding = 10;
        # blur = true;
        # blur_size = 3;
        # blur_passes = 1;
      };

      animations = {
        enabled = true;
      };

      # Add your keybindings and other config here
    };

    # You can also use extraConfig for more complex configurations
    extraConfig = ''
      # Keybindings
      bind = $mod, Return, exec, ghostty
      bind = $mod, Q, killactive
      bind = $mod, M, exit
      bind = $mod, E, exec, dolphin
      bind = $mod, T, togglefloating
      bind = $mod, A, exec, wofi --show drun
      bind = $mod, P, pseudo
      bind = ALT, Return, fullscreen
      bind = $mod, R, togglesplit

      # Move focus
      bind = $mod, h, movefocus, l
      bind = $mod, l, movefocus, r
      bind = $mod, k, movefocus, u
      bind = $mod, j, movefocus, d

      # Workspaces
      bind = $mod, 1, workspace, 1
      bind = $mod, 2, workspace, 2
      bind = $mod, 3, workspace, 3
      bind = $mod, 4, workspace, 4
      bind = $mod, 5, workspace, 5
      bind = $mod, 6, workspace, 6
      bind = $mod, 7, workspace, 7
      bind = $mod, 8, workspace, 8
      bind = $mod, 9, workspace, 9
      bind = $mod, 0, workspace, 10


      # Move Window To Workspaces
      bind = $mod+Shift, 1, movetoworkspace, 1
      bind = $mod+Shift, 2, movetoworkspace, 2
      bind = $mod+Shift, 3, movetoworkspace, 3
      bind = $mod+Shift, 4, movetoworkspace, 4
      bind = $mod+Shift, 5, movetoworkspace, 5
      bind = $mod+Shift, 6, movetoworkspace, 6
      bind = $mod+Shift, 7, movetoworkspace, 7
      bind = $mod+Shift, 8, movetoworkspace, 8
      bind = $mod+Shift, 9, movetoworkspace, 9
      bind = $mod+Shift, 0, movetoworkspace, 10

      # Reize and move windows
      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow

    '';
  };

  # Programs that work well with Hyprland
  programs.waybar.enable = true;
  programs.wofi.enable = true;

  home.packages = with pkgs; [
    swww
    grim
    wireplumber
    libgtop
    bluez
    hyprpanel
    networkmanager
    dart-sass
    wl-clipboard
    upower
    gvfs
    hyprpicker
    btop
    inputs.superfile.packages.${system}.default

  ];

  # Terminal that works well with Wayland
  programs.ghostty = {
    enable = true;
    settings = {
      # Alacritty settings
    };
  };
}
