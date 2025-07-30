{ inputs, lib, self, ... }:

{
  imports = [
    ./devshell.nix
    ./git-hooks.nix
    ./nixvim.nix
    ./treefmt.nix
  ];

  perSystem = { system, config, ... }: let
    pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrValues (self.overlays or {});
      config.allowUnfree = true;
    };

    nixvimLib = inputs.nixvim.lib.${system};
    nixvimLegacy = inputs.nixvim.legacyPackages.${system};

    nixvimModule = {
      inherit system;
      module = import ../modules/nixvim;
      extraSpecialArgs = {
        # optionally pass extra arguments to your nixvim config
      };
    };

    nvim = nixvimLegacy.makeNixvimWithModule nixvimModule;

  in {
    _module.args.pkgs = pkgs;

    packages.nixvim = nvim;
    packages.default = nvim;

    checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
  };
}
