
{ config, pkgs, inputs,  ... }:

{

  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = "simpa-laptop";

  imports = [
    # ./modules/hyprland
    # ./modules/hyprland/hyprpanel.nix
    ./modules/fish
    # ./modules/apps
    ./modules/nvim
    # ./modules/gaming
    ./modules/sway
    ./modules/waybar
    ./modules/tmux
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
  programs.fish.enable = true;

  # stylix.targets.ghostty.enable = false;
  # programs.ghostty = {
  #   enable = true;
  # };

  # programs.obs-studio = {
  #   enable = true;
  #   # Add any additional configuration options here
  # };
  # Packages to install for your user
  home.packages = with pkgs; [
    # Basic tools
    # curl
    # wget
    # git
    # htop
    lazygit
    github-cli
    gh-dash
    # feh
    # jq
    # grimblast
    # slurp
    # swappy
    # swww
    # wireplumber
    # libgtop
    # bluez
    # # hyprpanel
    # networkmanager
    # dart-sass
    # wl-clipboard
    # upower
    # gvfs
    # btop
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
