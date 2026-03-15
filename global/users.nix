# { pkgs, ...}:

# Define a user account
{
  users.users.suwapotta = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    # packages = with pkgs; [
    # User's packages
    # ];
  };

}
