import 'package:json_annotation/json_annotation.dart';

part 'navigation_endpoint.g.dart';

abstract class Endpoint {}

@JsonSerializable()
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
    return _$WatchFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WatchToJson(this);
  }

  String? get type => watchEndpointMusicSupportedConfigs
      ?.watchEndpointMusicConfig?.musicVideoType;
}

@JsonSerializable()
class WatchEndpointMusicSupportedConfigs {
  WatchEndpointMusicConfig? watchEndpointMusicConfig;

  WatchEndpointMusicSupportedConfigs({this.watchEndpointMusicConfig});

  factory WatchEndpointMusicSupportedConfigs.fromJson(
      Map<String, dynamic> json) {
    return _$WatchEndpointMusicSupportedConfigsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WatchEndpointMusicSupportedConfigsToJson(this);
  }
}

@JsonSerializable()
class WatchEndpointMusicConfig {
  String? musicVideoType;

  WatchEndpointMusicConfig({this.musicVideoType});

  factory WatchEndpointMusicConfig.fromJson(Map<String, dynamic> json) {
    return _$WatchEndpointMusicConfigFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WatchEndpointMusicConfigToJson(this);
  }
}

@JsonSerializable()
class WatchPlaylist extends Endpoint {
  String? params;
  String? playlistId;

  WatchPlaylist({this.params, this.playlistId});

  factory WatchPlaylist.fromJson(Map<String, dynamic> json) {
    return _$WatchPlaylistFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WatchPlaylistToJson(this);
  }
}

@JsonSerializable()
class Browse extends Endpoint {
  String? params;
  String? browseId;
  BrowseEndpointContextSupportedConfigs? browseEndpointContextSupportedConfigs;

  Browse(
      {this.params, this.browseId, this.browseEndpointContextSupportedConfigs});

  factory Browse.fromJson(Map<String, dynamic> json) {
    return _$BrowseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrowseToJson(this);
  }
}

@JsonSerializable()
class BrowseEndpointContextSupportedConfigs {
  BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig;

  BrowseEndpointContextSupportedConfigs(
      {this.browseEndpointContextMusicConfig});

  factory BrowseEndpointContextSupportedConfigs.fromJson(
      Map<String, dynamic> json) {
    return _$BrowseEndpointContextSupportedConfigsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrowseEndpointContextSupportedConfigsToJson(this);
  }
}

@JsonSerializable()
class BrowseEndpointContextMusicConfig {
  String? pageType;

  BrowseEndpointContextMusicConfig({this.pageType});

  factory BrowseEndpointContextMusicConfig.fromJson(Map<String, dynamic> json) {
    return _$BrowseEndpointContextMusicConfigFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrowseEndpointContextMusicConfigToJson(this);
  }
}

@JsonSerializable()
class Search extends Endpoint {
  String? params;
  String? query;

  Search({this.params, this.query});

  factory Search.fromJson(Map<String, dynamic> json) {
    return _$SearchFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SearchToJson(this);
  }
}

@JsonSerializable()
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
    return _$NavigationEndpointFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NavigationEndpointToJson(this);
  }

  Endpoint? get endpoint {
    return watchEndpoint ??
        browseEndpoint ??
        watchPlaylistEndpoint ??
        searchEndpoint;
  }
}
