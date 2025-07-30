{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        name = "wien's nixvim dev shell";
        meta.description = "Shell environment for modifying this Nix configuration";
        packages = with pkgs; [
          nixd
        ];
      };
    };
}
