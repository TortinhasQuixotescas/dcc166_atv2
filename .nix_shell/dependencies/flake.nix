{
  description = "PNPM development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell {

            packages = with pkgs; [
              ## Dependencies
              libuuid
              openssl
              python3

              ## Packages
              nodejs
              pnpm
              graphviz
            ];

            LD_LIBRARY_PATH = with pkgs; "${stdenv.cc.cc.lib}/lib";

          };
        }
      );
    };

}
