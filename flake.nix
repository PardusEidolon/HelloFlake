{
  description = "Simple hello";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        pkgs = nixpkgs.legacyPackages.${system}; # currently need the legacy packages to make ends meet otherwise nix fails to evaluate
        myDerivation = with pkgs;
          stdenv.mkDerivation {
            name = "hello";
            src = self;
            buildInputs = [ghc];
            buildPhase = "ghc -o hello ./Main.hs"; # builds it into a temporary directory
            installPhase = "mkdir -p $out/bin; install -t $out/bin hello"; # creates a directory and copies the compiled files to the target directory
            system = system;
          };
      in {
        formatter = with pkgs; alejandra; # no need to define the system as flake-utils takes care of it for you.
        packages.default = myDerivation; # used for nix build
        devShells.hello = myDerivation; # used for nix develop & nix shell can be called by running the follwing command 'nix develop .#hello' or 'nix shell .#hello'
        apps.default = {
          type = "app";
          program = "${myDerivation}/bin/hello";
        }; # used for nix run
      }
    );
}
