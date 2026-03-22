# Define a user account

{
  users.users.suwapotta = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
