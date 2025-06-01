{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            (python312.withPackages (ppkgs: (with ppkgs; [
              pip
              pyzmq
              jupyter
              notebook
              numpy
              scikit-learn
              jupyterlab
              jupyter-all
              matplotlib
              pandas
            ])))
          ];
        };
      }
    );
}
