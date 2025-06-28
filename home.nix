{ config, pkgs, ... }:
{
  home = {
    username = "gurbiggg";
    homeDirectory = "/home/gurbiggg";

    packages = with pkgs; [
      # Tools
      just

      # Apps
      discord
      bottles

      # Games
      #retroarch-full

    ];

    preferXdgDirectories = true;
    
    shellAliases = {};


    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";
  };


  programs = {
    home-manager = {
      enable = true;
      path = "$HOME/.config/nixos/";
    };

    nh = {
      enable = true;
      flake = "/home/gurbiggg/.config/nixos";
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep-since 5d";
      };
    };

    git = {
      enable = true;
      userName = "Gehrig Dixon";
      userEmail = "gmand4101@gmail.com";
    };

    fish = {
      enable = true;
      generateCompletions = true;
      shellAliases = {};
      shellAbbrs = {};
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    btop.enable = true;

    neovim = {
      enable = true;
      #extraConfig = lib.fileContents some/relative/path;
    };
    emacs.enable = true;
  };
}

