{ pkgs, ... }:

{
  packages = with pkgs; [
    just
    semver-tool
    gh
  ];
}
