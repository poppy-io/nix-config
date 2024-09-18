{
  nixpkgs,
  lix-module,
  inputs,
  home-manager,
  ...
}: {
  poppybox = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      lix-module.nixosModules.default

      ./common
      ./poppybox

      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";

        home-manager.extraSpecialArgs = {inherit inputs;};
        home-manager.users = import ./poppybox/users;
      }
    ];
  };

  poppytop = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};

    modules = [
      lix-module.nixosModules.default

      ./common
      ./poppytop

      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";

        home-manager.extraSpecialArgs = {inherit inputs;};
        home-manager.users = import ./poppytop/users;
      }
    ];
  };
}
