enum Endpoint {
  config,
  guide,
  player,
  browse,
  search,
  next,
  get_transcript,
  music_get_search_suggestions,
  music_get_queue
}

enum Request {
  Config,
  Search,
  Player,
  Home,
  ChannelPage,
  Playlist,
  WatchNext,
  BrowseHomePage,
  BrowseArtistDetailPage,
  BrowseAlbumDetailPage,
  BrowsePlaylistDetailPage,
  BrowseExplorePage,
  BrowseNewReleasesPage,
  BrowseChartsPage,
  BrowseMoodsAndGenresPage,
  BrowseMoodsAndGenresCategoryPage,
  MusicGuide,
  MusicQueue,
  MusicWatchNext,
  MusicSearchSuggestions,
  MobileMainAppGuide,
  WebMainAppGuide
}

enum ErrorStatus { FAILED_PRECONDITION }

enum RequestContext { channel_creator }

enum BrowseId {
  // Youtube Music
  FEmusic_explore,
  FEmusic_new_releases,
  FEmusic_charts,
  FEmusic_home,
  FEmusic_moods_and_genres,
  FEmusic_moods_and_genres_category,

  // Toutube
  FEwhat_to_watch,
  FEshorts,
  FElibrary,

  // Youtube Kids
  FEkids_home,
}
