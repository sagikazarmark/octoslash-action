{ pkgs, ... }:

{
  cachix.pull = [ "sagikazarmark-dev" ];

  packages = with pkgs; [
    just
    semver-tool
    gh
  ];
}
