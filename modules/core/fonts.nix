{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono

      work-sans

      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
  };
}
