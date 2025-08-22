{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        name = "wug's nixvim shell";
        meta.description = "Shell environment for modifying this Nix configuration";
        packages = with pkgs; [
          nixd
        ];
      };
    };
}
