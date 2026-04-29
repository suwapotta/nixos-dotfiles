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
# With laptop host:
# .../<c-project-directory>
## Shell abbreviation: `nfitl` (current repository)
nix flake init -t github:suwapotta/nixos-dotfiles/hosts/laptop#c

## Shell abbreviation: `nfitr` (local ~/nixos-dotfiles)
nix flake init -t ~/nixos-dotfiles/hosts/laptop#c
```

- [**devshell Documentation**]<https://flake.parts/options/devshell>

- **Disko configuration**: (WIP)
