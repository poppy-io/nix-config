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
      visualizer_type = "spectrum";
      visualizer_spectrum_smooth_look = "yes";
      visualizer_fps = "255";
      visualizer_look = "##";

      # tabs
      screen_switcher_mode = "playlist, media_library, playlist_editor, lyrics, last_fm";
      startup_screen = "playlist";
      playlist_display_mode = "columns";
      browser_display_mode = "columns";
      search_engine_display_mode = "columns";
      playlist_editor_display_mode = "columns";

      # library
      autocenter_mode = "yes";
      media_library_primary_tag = "album_artist";
      space_add_mode = "add_remove";

      # lyrics
      lyrics_fetchers = "genius, justsomelyrics, jahlyrics, tekstowo, internet";
      follow_now_playing_lyrics = "yes";
      fetch_lyrics_for_current_song_in_background = "yes";
      store_lyrics_in_song_dir = "no";

      # playlist
      playlist_separate_albums = "yes";
      playlist_shorten_total_times = "yes";
    };
  };
}
