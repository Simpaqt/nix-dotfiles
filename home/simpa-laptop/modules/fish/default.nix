# modules/fish/default.nix
{ config, pkgs, lib, ... }:
{
 
  home.packages = with pkgs; [
    bat           # For syntax highlighting
    fzf           # For fuzzy finding
    fd            # For file finding
    ripgrep
    imagemagick
    openssl
    pkg-config
    eza
    rustlings
    yt-dlp
    fastfetch
    pandoc
    protonmail-bridge
    manga-tui
    protonmail-bridge-gui
    p11-kit
    onefetch
    unzip
    aerc
    epy
  ];
   
  stylix.targets.fish.enable = false;
  programs.fish = {
    enable = true;
    # Use Home Manager's aliases system which should translate correctly to Fish
    
     shellInit = ''
       # Remove greeting
       set -g fish_greeting
       set -gx EDITOR nvim


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
       alias todo="cargo run --manifest-path ~/Coding/Rust/todo-list/Cargo.toml"

       #nix alias
       alias rebuild="sudo nixos-rebuild switch --flake ~/nixos#nixos"
       alias hms="home-manager switch"
       alias update="nix flake update ~/nixos#nixos"
       alias cleanup="sudo nix-collect-garbage -d"
       alias rbs="sudo nixos-rebuild switch -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos/nixpkgs -I nixos-config=/etc/nixos/configuration.nix"
       alias spf="superfile"

       # fish colors
       set -U fish_color_normal f8f8f2
       set -U fish_color_command 8be9fd
       set -U fish_color_quote f1fa8c
       set -U fish_color_redirection f8f8f2
       set -U fish_color_end ffb86c
       set -U fish_color_error ff5555
       set -U fish_color_param bd93f9
       set -U fish_color_comment 6272a4
       set -U fish_color_match --background=brblue
       set -U fish_color_selection --background=44475a
       set -U fish_color_search_match --background=44475a
       set -U fish_color_history_current --bold
       set -U fish_color_operator 50fa7b
       set -U fish_color_escape ff79c6
       set -U fish_color_cwd 50fa7b
       set -U fish_color_cwd_root red
       set -U fish_color_valid_path --underline
       set -U fish_color_autosuggestion 6272a4
       set -U fish_color_user 8be9fd
       set -U fish_color_host bd93f9
       set -U fish_color_cancel ff5555 --reverse
       set -U fish_pager_color_background
       set -U fish_pager_color_prefix 8be9fd
       set -U fish_pager_color_progress 6272a4
       set -U fish_pager_color_completion f8f8f2
       set -U fish_pager_color_description 6272a4
       set -U fish_pager_color_selected_background --background=44475a
       set -U fish_pager_color_selected_prefix 8be9fd
       set -U fish_pager_color_selected_completion f8f8f2
       set -U fish_pager_color_selected_description 6272a4
       set -U fish_color_host_remote
       set -U fish_color_keyword
       set -U fish_pager_color_secondary_completion
       set -U fish_color_option
       set -U fish_pager_color_secondary_background
       set -U fish_pager_color_secondary_prefix
       set -U fish_pager_color_secondary_description
       function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      end
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
    # shellWrapperName = "y";
  };
}

