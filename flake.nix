{
  description = "System config flake";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.follows = "nixos-cosmic/nixpkgs";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs = inputs@{ self, nixpkgs 
  , nixos-cosmic 
  }: {
    nixosConfigurations = {
      legion = nixpkgs.lib.nixosSystem {
        system = "x86_64-linx";
        modules = [
	  {
	  nix.settings = {
	    substituters = [ "https://cosmic.cachix.org/" ];
	    trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
	  };
	  }
	  nixos-cosmic.nixosModules.default
          ./configuration.nix
        ];
      };
    };
  };
}
