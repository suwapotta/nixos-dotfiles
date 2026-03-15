{

  # Remove glitchy audio issue
  security.rtkit.enable = true;

  # Enable sound (pipewire)
  services.pipewire = {
    enable = true;

    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
}
