{ config, pkgs, ... }:
{
  programs.gpg = {
    enable = true;
  };
  
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";  # You can choose "gtk2", "qt", or "gnome3" instead
  };
}
