# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
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
MIIDkjCCAnqgAwIBAgIQJZEdRNt2A+E9MchGHJqXdTANBgkqhkiG9w0BAQsFADBL
MQswCQYDVQQGEwJDSDESMBAGA1UEChMJUHJvdG9uIEFHMRQwEgYDVQQLEwtQcm90
b24gTWFpbDESMBAGA1UEAxMJMTI3LjAuMC4xMB4XDTI1MDMyNTE2MzcwMloXDTQ1
MDMyMDE2MzcwMlowSzELMAkGA1UEBhMCQ0gxEjAQBgNVBAoTCVByb3RvbiBBRzEU
MBIGA1UECxMLUHJvdG9uIE1haWwxEjAQBgNVBAMTCTEyNy4wLjAuMTCCASIwDQYJ
KoZIhvcNAQEBBQADggEPADCCAQoCggEBAKkjMhfGYTCNd9LfPQinfB3nfZpNDy9P
uLQjBu4rNuajJETOGaZWXra1wcSfar4iZFfmCJ6lP1ex6snNssQwUfqlmbTifiCO
9a9rueFME3qVQAEuhZKBY2zik23H5Of4XBb9cqq0zt8/xcIVWTe1SQFw7CkOLVdY
L5dx6K6rmqetcbFWSi6hMZIpGADpgOdQ4Xzmnzjg+vKed8aemf9ldl6Vxu8eI2n/
q76g7TrGuhtLc6NK4Wkq86KuYYqMI2XTU8390eEJ6ReZFWFLLO56oTgIVAPlfeWx
QjptkLdJ7Cs7lIIU9oiCrneT9NwlfezqymB00uGdS+KW+ftOvh0oW0UCAwEAAaNy
MHAwDgYDVR0PAQH/BAQDAgKkMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcD
AjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQUycOheubo2VV7r/sOyq7WOsnt
fDAPBgNVHREECDAGhwR/AAABMA0GCSqGSIb3DQEBCwUAA4IBAQAT8GUtssKP07es
gv2MbNcxB8S0HFqsvsW48M7D67HX81Od+eOD6mB5NUMnLISBPF9ng51RAUGTWlTS
X5r9NmLnnMn39XG5L7wj8YFP3U99am5IBjXLqwZd3WZRKPwOlQhUuEpTac6KjHkq
6RO8UQGeEff26dXK6Idmbu1PjgiUq5xE9OPtKl0ezcMG425BSRE43Hr36gsynnJK
hfA2weLsSC2gz8j6MLZ07O84XtgZ5JGYHD8/UaACFpc/0ulIdvR2XAbY8WhxqrjO
1m4EE2V+c0/Y54nAsju/Rl3uEAv1Z/t6sT9GJMbDlWDVMyC13OpFBVGgFh4E9UBf
DnFgsQmK
-----END CERTIFICATE-----
    ''
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

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

  # Install firefox.
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

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
