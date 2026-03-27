{
  flake.nixosModules."qemu" =
    { pkgs, ... }:

    {
      specialisation."VM-Host".configuration = {
        system.nixos.tags = [ "VM-Host" ];

        users.users."suwapotta".extraGroups = [
          "libvirtd"
          "kvm"
        ];

        programs.virt-manager.enable = true;
        virtualisation = {
          libvirtd = {
            enable = true;

            qemu = {
              package = pkgs.qemu_kvm;
              runAsRoot = true;
              # swtpm.enable = true; # Required for Windows 11 VMs
            };
          };

          # spiceUSBRedirection.enable = true;
        };

        # services.spice-vdagentd.enable = true;
      };
    };
}
