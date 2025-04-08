{ config, pkgs, inputs,  ... }:

{

  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = "simpa";
  home.homeDirectory = "/home/simpa";

  imports = [
    # ./modules/hyprland
    # ./modules/hyprland/hyprpanel.nix
    ./modules/fish
    ./modules/apps
    ./modules/nvim
    ./modules/gaming
    ./modules/sway
    ./modules/waybar
    ./modules/tmux
    ./modules/gnupg
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
  programs.fish.enable = true;

  stylix.targets.ghostty.enable = false;
  programs.ghostty = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;
    # Add any additional configuration options here
  };
  # Packages to install for your user
  home.packages = with pkgs; [
    # Basic tools
    curl
    wget
    git
    htop
    lazygit
    github-cli
    gh-dash
    feh
    jq
    swww
    wireplumber
    libgtop
    # hyprpanel
    networkmanager
    dart-sass
    upower
    gvfs
    btop
    # Add more packages as needed
    # firefox
    # vscode
    # neovim
  ];

  # Manage specific dotfiles and programs
  # programs.bash = {
  #   enable = true;
  #   shellAliases = {
  #     ll = "ls -la";
  #     update = "sudo nixos-rebuild switch --flake ~/nixos#nixos";
  #     vi = "nvim";
  #     vim = "nvim";
  #     # Add other aliases as needed
  #   };
  #   # Add other bash configurations here
  # };

  # Git configuration example
  programs.git = {
    enable = true;
    userName = "Simpaqt";
    userEmail = "simpaqt@yahoo.com";
    extraConfig = {
      diff.tool = "nvimdiff";
    };
    # Add other git configurations here
  };

  # Other program configurations can be added similarly
  # programs.vscode.enable = true;
  # programs.neovim.enable = true;

  # Manage your dotfiles
  # home.file.".config/some-program/config".source = ./dotfiles/some-program/config;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "25.05"; # Change to match your NixOS version
}
