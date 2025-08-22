# nixvim

_soon. i feel lazy rn_

---

## Install

### 1. Add the input to your flake.nix file

```nix
# flake.nix
inputs.nixvim = {
  url = "github:qfumbled/nixvim";
};


### 2. add it to your outputs (very simple)


### 3.
``nix
# NixOS
environment.systemPackages = [
  inputs.nixvim.packages.${pkgs.system}.default
];

# OR home-manager
home.packages = [
  inputs.nixvim.packages.${pkgs.system}.default
];
``

TODO: add Screenshots im lit lazy
