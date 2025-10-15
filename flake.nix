{
  description = "A flake for my desktop config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pyprland = {
      url = "github:hyprland-community/pyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      home-manager,
      nixpkgs,
      pyprland,
      stylix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        nix-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            stylix.nixosModules.stylix
            ./nixos-desktop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.useUserPackages = true;
              home-manager.users.marcm = {
                nixpkgs.config.allowUnfree = true;
                nixpkgs.config.rocmSupport = true;
                imports = [
                  stylix.homeModules.stylix
                  ./home.nix
                ];
              };
            }
          ];
        };
      };
    };
}
