{pkgs ? import <nixpkgs> {}}:
with pkgs;
    mkShell = {
        name = "hey";
        buildInputs = [hello];
    };