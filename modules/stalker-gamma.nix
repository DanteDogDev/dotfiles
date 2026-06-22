{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python313 # Matches your virtualenv version
    pkgs.libunrar
  ];

  shellHook = ''
    # Dynamically find libunrar.so in the Nix store and export it
    export UNRAR_LIB_PATH="${pkgs.libunrar}/lib/libunrar.so"
    
    # Automatically activate your venv if it exists
    if [ -d "venv" ]; then
      source venv/bin/activate
    fi
  '';
}
