{
  description = "Gurbiggg system config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    #nixpkgs.follows = "nixos-cosmic/nixpkgs";

    #nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs,
                     #nixos-cosmic,
                     home-manager, ... }: {
                       homeConfigurations."gurbiggg" = home-manager.lib.homeManagerConfiguration {
                         pkgs = import nixpkgs {
                           system = "x86_64-linux";
                           config.allowUnfree = true;
                         };
                         modules = [
                           ./home.nix
                         ];
                       };

                       nixosConfigurations = {
                         legion = nixpkgs.lib.nixosSystem {
                           system = "x86_64-linx";
                           modules = [
                             ./configuration.nix

                             home-manager.nixosModules.home-manager {
                               home-manager = {
                                 useGlobalPkgs = true;
                                 useUserPackages = true;
                                 users.gurbiggg = ./home.nix;
                               };
                             }

#	  nixos-cosmic.nixosModules.default {
#	    nix.settings = {
#	      substituters = [ "https://cosmic.cachix.org/" ];
#	      trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
#	    };
#	  }
        ];
      };
    };
  };
}
