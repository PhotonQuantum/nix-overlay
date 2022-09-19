# Nix Overlay of LightQuantum's Packages

This is a collection of packages that I use on my systems. Feel free to use them if you want.

## Usage

To use this overlay, add the following to your `flake.nix`:

```nix
{
    lq = {
      url = "github:PhotonQuantum/nix-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, lq }: {
      nixosConfigurations = {
        myhost = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            { nixpkgs.overlays = [ lq.overlay ]; }
            ./configuration.nix
          ];
        };
      };
    };
}
```

Then you can use the packages like this:

```nix
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lq.universal-ctags-pcre2
  ];
}
```