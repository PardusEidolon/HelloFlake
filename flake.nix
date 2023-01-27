{
  description = "my project description";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let 
			pkgs = nixpkgs.legacyPackages.${system};
			myDerivation = with pkgs;
				stdenv.mkDerivation{
					name = "hey";
					src = self;
					buildInputs = [ ghc ];
					buildPhase = "ghc -o hello ./Main.hs";
				};
		in
        	{
          		packages.default = myDerivation;
        	}
      );
}