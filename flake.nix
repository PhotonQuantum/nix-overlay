{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: {
    overlay =
      let
        packages = (system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
          in
          {
            universal-ctags-pcre2 = (import ./universal-ctags-pcre2) pkgs;
          }
        );
      in
      final: prev: {
        lq = packages prev.system;
      };
  };
}
