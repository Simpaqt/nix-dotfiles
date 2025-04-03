{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    style = ''
      * {
        font-family: "JetBrains Mono", "Font Awesome 6 Free";
        font-size: 13px;
        font-weight: bold;
      }

      window#waybar {
        background-color: rgba(36, 40, 59, 0.9);
        color: #A9B1D6;
        border-radius: 0px;
      }

      .modules-left, .modules-center, .modules-right {
        margin: 5px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #workspaces button {
        padding: 0 5px;
        margin: 0 3px;
        background-color: transparent;
        color: #A9B1D6;
        border-radius: 3px;
      }

      #workspaces button.focused {
        background-color: #BB9AF7;
        color: #24283B;
      }

      #workspaces button.urgent {
        background-color: #F7768E;
        color: #24283B;
      }

      #mode {
        background-color: #F7768E;
        color: #24283B;
        padding: 0 5px;
        margin: 0 5px;
        border-radius: 3px;
      }

      #clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray, #mode {
        padding: 0 8px;
        margin: 0 4px;
      }

      #clock {
        background-color: #2AC3DE;
        color: #24283B;
        border-radius: 3px;
      }

      #battery {
        background-color: #9ECE6A;
        color: #24283B;
        border-radius: 3px;
      }

      #battery.charging {
        background-color: #9ECE6A;
      }

      #battery.warning:not(.charging) {
        background-color: #F7768E;
        color: #24283B;
      }

      #cpu {
        background-color: #BB9AF7;
        color: #24283B;
        border-radius: 3px;
      }

      #memory {
        background-color: #0DB9D7;
        color: #24283B;
        border-radius: 3px;
      }

      #network {
        background-color: #B4F9F8;
        color: #24283B;
        border-radius: 3px;
      }

      #pulseaudio {
        background-color: #C0CAF5;
        color: #24283B;
        border-radius: 3px;
      }

      #tray {
        background-color: #444B6A;
        border-radius: 3px;
      }
    '';
    settings = [{
      layer = "top";
      position = "top";
      height = 30;
      modules-left = ["sway/workspaces" "sway/mode"];
      modules-center = ["sway/window"];
      modules-right = ["cpu" "memory" "network" "pulseaudio" "clock" "tray"];
      
      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        format = "{icon}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "10";
          urgent = "";
          focused = "";
          default = "";
        };
      };
      
      "sway/window" = {
        format = "{}";
        max-length = 50;
      };
      
      "cpu" = {
        format = " {usage}%";
        tooltip = false;
        interval = 1;
      };
      
      "memory" = {
        format = " {}%";
        interval = 1;
      };
      
      # "network" = {
      #   format-wifi = " {essid}";
      #   format-ethernet = " {ifname}: {ipaddr}";
      #   format-disconnected = "⚠ Disconnected";
      #   tooltip = false;
      # };
      
      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon} {volume}%";
        format-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          default = ["" ""];
        };
        scroll-step = 1;
        on-click = "pavucontrol";
      };
      
      "clock" = {
        format = " {:%H:%M %d/%m/%Y}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        interval = 60;
      };
      
      "tray" = {
        icon-size = 18;
        spacing = 10;
      };
    }];
  };

  home.packages = with pkgs; [
    font-awesome     # Icons for waybar
    jetbrains-mono   # Main font
    pavucontrol      # For volume control via waybar
  ];
}
