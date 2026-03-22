{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  hardware.amdgpu = {
    initrd.enable = true;
    opencl.enable = true;
  };
}
