{pkgs, ...}: {
  system.packages = with pkgs.gst_all_1; [
    gstreamer
    gst-plugins-base
    gst-plugins-good
    gst-plugins-bad
    gst-libav
  ];
}
