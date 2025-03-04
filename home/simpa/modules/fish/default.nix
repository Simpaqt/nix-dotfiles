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

       #abbreviations
       
       abbr -a mkdir "mkdir -p"
       abbr .. 'cd ..'
       abbr ... 'cd ../..'
       abbr .3 'cd ../../..'
       abbr .4 'cd ../../../..'
       abbr .5 'cd ../../../../..'

       #aliases
       alias vi="nvim"
       alias vim="nvim"
       alias ani="ani-cli"
       alias lg="lazygit"
       alias ld="lazydocker"
       alias c="clear"
       alias l='eza -lh  --icons=auto' # long list
       alias ls='eza -1   --icons=auto' # short list
       alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
       alias ld='eza -lhD --icons=auto' # long list dirs
       alias lt='eza --icons=auto --tree' # list folder as tree
       alias str="sudo mount /dev/sdb3 /Storage"
       alias str2="sudo mount /dev/sdb4 /Storage2"
       alias gmg="sudo mount /dev/nvme0n1p1 /Gaming"

       #nix alias
       alias rebuild="sudo nixos-rebuild switch --flake ~/nixos#nixos"
       alias hms="home-manager switch"
       alias update="nix flake update ~/nixos#nixos"
       alias cleanup="sudo nix-collect-garbage -d"
       alias rbs="sudo nixos-rebuild switch -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos/nixpkgs -I nixos-config=/etc/nixos/configuration.nix"
       alias y="yazi"
       alias spf="superfile"
        


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

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
}

