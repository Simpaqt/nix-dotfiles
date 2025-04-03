{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (writeTextFile {
      name = "sway-session";
      destination = "/share/wayland-sessions/sway.desktop";
      text = ''
        [Desktop Entry]
        Name=Sway
        Comment=An i3-compatible Wayland compositor
        Exec=sway
        Type=Application
      '';
    })
  ];
}
