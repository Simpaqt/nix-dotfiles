# modules/fish/default.nix
{ config, pkgs, lib, ... }:
{
 
  home.packages = with pkgs; [
    bat           # For syntax highlighting
    fzf           # For fuzzy finding
    fd            # For file finding
    eza

  ];
   
  programs.fish = {
    enable = true;

    # Use Home Manager's aliases system which should translate correctly to Fish
    
     shellInit = ''
       # Remove greeting
       set -g fish_greeting
     '';
  #
  #   interactiveShellInit = ''
  #     # Load completions from Nix profiles
  #     begin
  #       # Source all completion files
  #       for p in $NIX_PROFILES
  #         set -l completions_dir $p/share/fish/vendor_completions.d
  #         if test -d $completions_dir
  #           for f in $completions_dir/*.fish
  #             source $f
  #           end
  #         end
  #       end
  #     end
  #   '';
  #
  };

  
  # Install additional packages that might be needed for Fish functionality
  
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}

