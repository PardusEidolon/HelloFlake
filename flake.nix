{
  description = "my project description";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let 
			pkgs = nixpkgs.legacyPackages.${system};
			myDerivation = with pkgs;
				derivation {
        			name = "hello";
        			src = ./Main.hs;
					args = [./builder.sh];
					builder = [ bash ];
					buildInputs = [ghc];
					system = system;
      			};
		in
        	{
				packages.default = myDerivation;
        	}
      );
}