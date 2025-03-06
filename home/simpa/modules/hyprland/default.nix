{ config, pkgs, inputs, ... }:

{
  # Your existing home-manager config...


  # Hyprland config
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$browser" = "vivaldi";
      # Example configuration
      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;
        # "col.active_border" = "rgba(33ccffee)";
        # "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        # blur = true;
        # blur_size = 3;
        # blur_passes = 1;
      };

      # blur = {
      #   enabled = true;
      #   size = 3;
      #   passes = 1;
      #   vibrancy = 0.1696;
      # };

      animations = {
        enabled = true;
        # bezzier = [
        #   "easeOutQuint,0.23,1,0.32,1"
        #   "easeInOutCubic,0.65,0.05,0.36,1"
        #   "linear,0,0,1,1"
        #   "almostLinear,0.5,0.5,0.75,1.0"
        #   "quick,0.15,0,0.1,1"
        # ];
        # animation = [
        #   "global, 1, 10, default"
        #   "border, 1, 5.39, easeOutQuint"
        #   "windows, 1, 4.79, easeOutQuint"
        #   "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        #   "windowsOut, 1, 1.49, linear, popin 87%"
        #   "fadeIn, 1, 1.73, almostLinear"
        #   "fadeOut, 1, 1.46, almostLinear"
        #   "fade, 1, 3.03, quick"
        #   "layers, 1, 3.81, easeOutQuint"
        #   "layersIn, 1, 4, easeOutQuint, fade"
        #   "layersOut, 1, 1.5, linear, fade"
        #   "fadeLayersIn, 1, 1.79, almostLinear"
        #   "fadeLayersOut, 1, 1.39, almostLinear"
        #   "workspaces, 1, 1.94, almostLinear, fade"
        #   "workspacesIn, 1, 1.21, almostLinear, fade"
        #   "workspacesOut, 1, 1.94, almostLinear, fade"
        # ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      input = {
        kb_layout = "us,no";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
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
      bind = $mod, F, exec, $browser
      bind = $mod, A, exec, wofi --show drun
      # bind = $mod, P, pseudo
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

      # Special workspace
      bind = $mod+Shift, S, movetoworkspacesilent, special
      bind = $mod, S, togglespecialworkspace,

      # Reize and move windows
      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow

      # printscreen

      bind = $mod, P, exec, grimblast copysave area
      bind = $mod+Shift, P, exec, grimblast copysave output

    '';
  };

  # Programs that work well with Hyprland
  stylix.targets.ghostty.enable = false;
  programs.waybar.enable = true;
  programs.wofi.enable = true;

  home.packages = with pkgs; [
    feh
    jq
    grimblast
    slurp
    swappy
    swww
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
  };
}
