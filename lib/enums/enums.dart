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

  // Youtube
  FEwhat_to_watch, // Home
  FEshorts,
  FElibrary,
  FEhistory, // History
  FEtrending,
  // Trending

  // Youtube Kids
  FEkids_home,
}

enum TrendingCategory {
  now('6gQJRkVleHBsb3Jl'),
  music('4gINGgt5dG1hX2NoYXJ0cw%3D%3D'),
  film('4gIKGgh0cmFpbGVycw%3D%3D'),
  game('4gIcGhpnYW1pbmdfY29ycHVzX21vc3RfcG9wdWxhcg%3D%3D');

  final String param;

  const TrendingCategory(this.param);
}
