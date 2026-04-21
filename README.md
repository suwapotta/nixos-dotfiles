# NixOS Dotfiles

<!--toc:start-->

- [NixOS Dotfiles](#nixos-dotfiles)
  - [NixOS Logo](#nixos-logo)
  - [Personal notes](#personal-notes)
  <!--toc:end-->

## NixOS Logo

![**NixOS** Distro logo](./images/logos/nixos-text.svg)

## Personal notes

- Initialize a language _template_ with `devshell` environment, e.g.:

```fish
# .../<c-project-directory>
## Shell abbreviation: `nfil` (current repository)
nix flake init -t github:suwapotta/nixos-dotfiles#c

## Shell abbreviation: `nfir` (local ~/nixos-dotfiles)
nix flake init -t ~/nixos-dotfiles#c
```

- [**devshell Documentation**]<https://flake.parts/options/devshell>
