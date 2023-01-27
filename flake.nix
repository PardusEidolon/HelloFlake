{
  description = "A very basic flake";
  
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: {
      flake-utils.lib.eachDefaultSystem (system:
	let
	  myPackage = with nixpkgs; 
	  	stdenv.mkDerivation {
		name = "Hello";
		src = self;
		buildInputs = [ ghc ];
		buildPhase = "ghc -o hello ./hello.hs";
		};
	in
	  myPackages
      )
  };
}
