{pkgs, ...}: {
  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
    };

    settings = {
      # visualiser
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "music_visualiser_fifo";
      visualizer_in_stereo = "yes";
      visualiser_type = "wave_filled";
      visualiser_look = "+|";
    };
  };
}
