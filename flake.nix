{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          typst
          tinymist

          bmake
          texlive.combined.scheme-full
          texlab
          plantuml
          graphviz
          dot2tex
          python3Packages.pygments
        ];
      };
    };
}
