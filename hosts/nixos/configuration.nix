# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./sway-session.nix
    ];

  # Bootloader.
 
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;
  home-manager.backupFileExtension = "backup";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  powerManagement.cpuFreqGovernor = "performance";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.flatpak.enable = true;
  security.pki.certificates = [
    ''
-----BEGIN CERTIFICATE-----
MIIDkjCCAnqgAwIBAgIQSh2wIvBrCqG1bESKUh3BmjANBgkqhkiG9w0BAQsFADBL
MQswCQYDVQQGEwJDSDESMBAGA1UEChMJUHJvdG9uIEFHMRQwEgYDVQQLEwtQcm90
b24gTWFpbDESMBAGA1UEAxMJMTI3LjAuMC4xMB4XDTI1MDMzMDE2MjYzM1oXDTQ1
MDMyNTE2MjYzM1owSzELMAkGA1UEBhMCQ0gxEjAQBgNVBAoTCVByb3RvbiBBRzEU
MBIGA1UECxMLUHJvdG9uIE1haWwxEjAQBgNVBAMTCTEyNy4wLjAuMTCCASIwDQYJ
KoZIhvcNAQEBBQADggEPADCCAQoCggEBALTWeZ3VV+6zXFoY7fVfydQLMpjGm7A8
1VlvlpKZ2GYZBVUOO5pLGXqkHt5HIIrLCc1380+0141iTyAZeCORRi4ZxYyA/T89
goMTIe9iVFeQkONcCSl6hrG6M6jppCV9cJojpmplL713xb4GrZuSgaTLeRgHxMGc
jhVOW15DlipYaW79AJ2+E0olw1NtFFpr1rknmiAmb5jDduKhC9G4OnkAKaSg5VQ/
148OUwNjJd5d8x2OqDqs1XrJiemGRB33eUTpGX+MBcJkAH398vcl1gDdQProNxRu
W+8jRF2tbR+riklnDsGW15mvmvMeWa/yd/heGH5yxEhKU60Mf1R+gMUCAwEAAaNy
MHAwDgYDVR0PAQH/BAQDAgKkMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcD
AjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSjr+W9CaWp8gbH20a5lkNndKep
2DAPBgNVHREECDAGhwR/AAABMA0GCSqGSIb3DQEBCwUAA4IBAQCbTE6LrM19R2RH
+O8h6Q5PIgNfYjRSjYudyKPEOwR6XgFEeGBFn6PtXGHO2cdtn39cuZ8EclIB7Z2c
sXROm33RqzlgQM+Wb7TmpPbeZVUs1JO5cUU1YO3VIHwAATWyjrKJKNbQe6Ef5foF
z/db5zqyLffbWd3JbeRXJBeiN2wSAAutfzRr5ePvJakYSh6f0tASbRkFkmxT3DIX
oRYimo5yPELklsD7IfoIYeyj5Dc1Tvb1ZMzYWMNswlU8MGhl25Y081KxlZDlgv+F
8chKZhsCQQFpKSauAxVNmxTIKir7VnTNeztiQPPDFlfo2MUrAYlVkKvXPb8aV7qz
vlHMqRh7
-----END CERTIFICATE-----
    ''
  ];

security.wrappers.wshowkeys = {
  source = "${pkgs.wshowkeys}/bin/wshowkeys";
  owner = "root";
  group = "root";
  setuid = true;
};

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  # minecraft
  # services.minecraft-server = {
  #   enable = true;
  #   eula = true;
  # };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.fish.enable = true;

  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "#24283B";
      base01 = "#16161E";
      base02 = "#343A52";
      base03 = "#444B6A";
      base04 = "#787C99";
      base05 = "#A9B1D6";
      base06 = "#CBCCD1";
      base07 = "#D5D6DB";
      base08 = "#C0CAF5";
      base09 = "#A9B1D6";
      base0A = "#0DB9D7";
      base0B = "#9ECE6A";
      base0C = "#B4F9F8";
      base0D = "#2AC3DE";
      base0E = "#BB9AF7";
      base0F = "#F7768E";
    };
  };
  environment.shells = with pkgs; [ fish bash ];

  users.users.simpa = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "simpa";
    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
   # packages = with pkgs; [
    #  kdePackages.kate
    #  thunderbird
   # ];
  };

  security.polkit.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures = {
      gtk = true; # So that GTK applications run with proper themes
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
  # Install firefox.
  programs.firefox.enable = true;
  programs.steam.enable = true;
  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   #wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
