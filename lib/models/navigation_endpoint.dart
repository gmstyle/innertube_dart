abstract class Endpoint {}

class Watch extends Endpoint {
  String? params;
  String? playlistId;
  String? videoId;
  int? index;
  String? playlistSetVideoId;
  WatchEndpointMusicSupportedConfigs? watchEndpointMusicSupportedConfigs;

  Watch({
    this.params,
    this.playlistId,
    this.videoId,
    this.index,
    this.playlistSetVideoId,
    this.watchEndpointMusicSupportedConfigs,
  });

  factory Watch.fromJson(Map<String, dynamic> json) {
    return Watch(
      params: json['params'],
      playlistId: json['playlistId'],
      videoId: json['videoId'],
      index: json['index'],
      playlistSetVideoId: json['playlistSetVideoId'],
      watchEndpointMusicSupportedConfigs:
          json['watchEndpointMusicSupportedConfigs'] != null
              ? WatchEndpointMusicSupportedConfigs.fromJson(
                  json['watchEndpointMusicSupportedConfigs'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'params': params,
      'playlistId': playlistId,
      'videoId': videoId,
      'index': index,
      'playlistSetVideoId': playlistSetVideoId,
      'watchEndpointMusicSupportedConfigs':
          watchEndpointMusicSupportedConfigs?.toJson(),
    };
  }

  String? get type => watchEndpointMusicSupportedConfigs
      ?.watchEndpointMusicConfig?.musicVideoType;
}

class WatchEndpointMusicSupportedConfigs {
  WatchEndpointMusicConfig? watchEndpointMusicConfig;

  WatchEndpointMusicSupportedConfigs({this.watchEndpointMusicConfig});

  factory WatchEndpointMusicSupportedConfigs.fromJson(
      Map<String, dynamic> json) {
    return WatchEndpointMusicSupportedConfigs(
      watchEndpointMusicConfig: json['watchEndpointMusicConfig'] != null
          ? WatchEndpointMusicConfig.fromJson(json['watchEndpointMusicConfig'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'watchEndpointMusicConfig': watchEndpointMusicConfig?.toJson(),
    };
  }
}

class WatchEndpointMusicConfig {
  String? musicVideoType;

  WatchEndpointMusicConfig({this.musicVideoType});

  factory WatchEndpointMusicConfig.fromJson(Map<String, dynamic> json) {
    return WatchEndpointMusicConfig(
      musicVideoType: json['musicVideoType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'musicVideoType': musicVideoType,
    };
  }
}

class WatchPlaylist extends Endpoint {
  String? params;
  String? playlistId;

  WatchPlaylist({this.params, this.playlistId});

  factory WatchPlaylist.fromJson(Map<String, dynamic> json) {
    return WatchPlaylist(
      params: json['params'],
      playlistId: json['playlistId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'params': params,
      'playlistId': playlistId,
    };
  }
}

class Browse extends Endpoint {
  String? params;
  String? browseId;
  BrowseEndpointContextSupportedConfigs? browseEndpointContextSupportedConfigs;

  Browse(
      {this.params, this.browseId, this.browseEndpointContextSupportedConfigs});

  factory Browse.fromJson(Map<String, dynamic> json) {
    return Browse(
      params: json['params'],
      browseId: json['browseId'],
      browseEndpointContextSupportedConfigs:
          json['browseEndpointContextSupportedConfigs'] != null
              ? BrowseEndpointContextSupportedConfigs.fromJson(
                  json['browseEndpointContextSupportedConfigs'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'params': params,
      'browseId': browseId,
      'browseEndpointContextSupportedConfigs':
          browseEndpointContextSupportedConfigs?.toJson(),
    };
  }
}

class BrowseEndpointContextSupportedConfigs {
  BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig;

  BrowseEndpointContextSupportedConfigs(
      {this.browseEndpointContextMusicConfig});

  factory BrowseEndpointContextSupportedConfigs.fromJson(
      Map<String, dynamic> json) {
    return BrowseEndpointContextSupportedConfigs(
      browseEndpointContextMusicConfig:
          json['browseEndpointContextMusicConfig'] != null
              ? BrowseEndpointContextMusicConfig.fromJson(
                  json['browseEndpointContextMusicConfig'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'browseEndpointContextMusicConfig':
          browseEndpointContextMusicConfig?.toJson(),
    };
  }
}

class BrowseEndpointContextMusicConfig {
  String? pageType;

  BrowseEndpointContextMusicConfig({this.pageType});

  factory BrowseEndpointContextMusicConfig.fromJson(Map<String, dynamic> json) {
    return BrowseEndpointContextMusicConfig(
      pageType: json['pageType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageType': pageType,
    };
  }
}

class Search extends Endpoint {
  String? params;
  String? query;

  Search({this.params, this.query});

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      params: json['params'],
      query: json['query'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'params': params,
      'query': query,
    };
  }
}

class NavigationEndpoint {
  Watch? watchEndpoint;
  WatchPlaylist? watchPlaylistEndpoint;
  Browse? browseEndpoint;
  Search? searchEndpoint;

  NavigationEndpoint({
    this.watchEndpoint,
    this.watchPlaylistEndpoint,
    this.browseEndpoint,
    this.searchEndpoint,
  });

  factory NavigationEndpoint.fromJson(Map<String, dynamic> json) {
    return NavigationEndpoint(
      watchEndpoint: json['watchEndpoint'] != null
          ? Watch.fromJson(json['watchEndpoint'])
          : null,
      watchPlaylistEndpoint: json['watchPlaylistEndpoint'] != null
          ? WatchPlaylist.fromJson(json['watchPlaylistEndpoint'])
          : null,
      browseEndpoint: json['browseEndpoint'] != null
          ? Browse.fromJson(json['browseEndpoint'])
          : null,
      searchEndpoint: json['searchEndpoint'] != null
          ? Search.fromJson(json['searchEndpoint'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'watchEndpoint': watchEndpoint?.toJson(),
      'watchPlaylistEndpoint': watchPlaylistEndpoint?.toJson(),
      'browseEndpoint': browseEndpoint?.toJson(),
      'searchEndpoint': searchEndpoint?.toJson(),
    };
  }

  Endpoint? get endpoint {
    return watchEndpoint ??
        browseEndpoint ??
        watchPlaylistEndpoint ??
        searchEndpoint;
  }
}
