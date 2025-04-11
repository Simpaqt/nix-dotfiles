{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (writeTextFile {
      name = "sway-session";
      destination = "/etc/xdg/wayland-sessions/sway.desktop";
      text = ''
        [Desktop Entry]
        Name=Sway
        Comment=An i3-compatible Wayland compositor
        Exec=sway
        Type=Application
      '';
    })
  ];
  
  # Ensure sway is enabled at the system level
  programs.sway = {
    enable = true;
    wrapperFeatures = {
      gtk = true;
      base = true; # Needed for GDM to find the session
    };
    extraPackages = with pkgs; [
      swayidle
      swaylock
      xwayland # For X11 application support
    ];
  };
  
  # Make sure XDG portal works with Sway
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
