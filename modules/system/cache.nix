{ config, lib, pkgs, ... }:

{
  nix.settings.substituters = [
    "https://cache.nixos.org"
    "https://nix-community.cachix.org"
    "https://cuda-maintainers.cachix.org"
    "https://nixpkgs-wayland.cachix.org"
    "https://nix-gaming.cachix.org/"
    "https://hyprland.cachix.org"
    "https://cachix.cachix.org"
    "https://mic92.cachix.org"
    "https://nixpkgs-unfree.cachix.org"
    "https://colmena.cachix.org"
    "https://nix-on-droid.cachix.org"
    "https://deploy-rs.cachix.org"
    "https://helix.cachix.org"
    "https://nur.cachix.org"
    "https://numtide.cachix.org"
    "https://oxalica.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "nixpkgs-wayland.cachix.org-1:3gMhhMuHk3L8nKCRr6WYsXUQYHCStDjQeVGJ9HY2cCM="
    "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
    "mic92.cachix.org-1:gi8IhgiT3CYZnJsaW7fxznzTkMUOn1RY4GmXdT/nXYQ="
    "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
    "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
    "nix-on-droid.cachix.org-1:56snoMJTXmDRC1Ei24CmKoUqvHJ9XCp+nidK7qkMQrU="
    "deploy-rs.cachix.org-1:xfNobmiwF/vzvK1gpfediPwpdIP0rpDV2rYqx40zdSI="
    "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
    "nur.cachix.org-1:F8+2oprcHLfsYyZBCsVJZJrPyGHwuE+EZBtukwalV7o="
    "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
    "oxalica.cachix.org-1:h0iRBw6tQD8+51ZvnNEBPbwLR58UD7klauDBWzBdugQ="
  ];
}
