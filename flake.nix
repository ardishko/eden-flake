{
  description = "Custom Nix packages";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          eden = pkgs.callPackage ./pkgs/eden { };
        }
      );

      overlays.default = final: prev: {
        eden = final.callPackage ./pkgs/eden { };
      };
    };
}
