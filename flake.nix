{
  description = "My NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # hyprland.url = "github:hyprwm/Hyprland";
    # nvf = {
    #   url = "github:notashelf/nvf";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    # hyprpanel.inputs.nixpkgs.follows = "nixpkgs";
    # superfile.url = "github:yorukot/superfile";
    stylix.url = "github:danth/stylix";
  };
  outputs = { self, nixpkgs, home-manager, nixvim, stylix, ... }@inputs: {
    # Desktop configuration
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixos/configuration.nix
        stylix.nixosModules.stylix
        # { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
	    imports = [
	      nixvim.homeManagerModules.nixvim
	      ./home/simpa/home.nix
	     ];
	    };
          };
        };
      ];
    };
    
    # Laptop configuration
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/laptop/configuration.nix  # Create this file
        stylix.nixosModules.stylix
        # { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.simpa-laptop = import ./home/simpa-laptop/home.nix;
          };
        }
      ];
    };
  };
}
