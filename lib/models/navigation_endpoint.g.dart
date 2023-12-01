// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_endpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Watch _$WatchFromJson(Map<String, dynamic> json) => Watch(
      params: json['params'] as String?,
      playlistId: json['playlistId'] as String?,
      videoId: json['videoId'] as String?,
      index: json['index'] as int?,
      playlistSetVideoId: json['playlistSetVideoId'] as String?,
      watchEndpointMusicSupportedConfigs:
          json['watchEndpointMusicSupportedConfigs'] == null
              ? null
              : WatchEndpointMusicSupportedConfigs.fromJson(
                  json['watchEndpointMusicSupportedConfigs']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatchToJson(Watch instance) => <String, dynamic>{
      'params': instance.params,
      'playlistId': instance.playlistId,
      'videoId': instance.videoId,
      'index': instance.index,
      'playlistSetVideoId': instance.playlistSetVideoId,
      'watchEndpointMusicSupportedConfigs':
          instance.watchEndpointMusicSupportedConfigs?.toJson(),
    };

WatchEndpointMusicSupportedConfigs _$WatchEndpointMusicSupportedConfigsFromJson(
        Map<String, dynamic> json) =>
    WatchEndpointMusicSupportedConfigs(
      watchEndpointMusicConfig: json['watchEndpointMusicConfig'] == null
          ? null
          : WatchEndpointMusicConfig.fromJson(
              json['watchEndpointMusicConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatchEndpointMusicSupportedConfigsToJson(
        WatchEndpointMusicSupportedConfigs instance) =>
    <String, dynamic>{
      'watchEndpointMusicConfig': instance.watchEndpointMusicConfig?.toJson(),
    };

WatchEndpointMusicConfig _$WatchEndpointMusicConfigFromJson(
        Map<String, dynamic> json) =>
    WatchEndpointMusicConfig(
      musicVideoType: json['musicVideoType'] as String?,
    );

Map<String, dynamic> _$WatchEndpointMusicConfigToJson(
        WatchEndpointMusicConfig instance) =>
    <String, dynamic>{
      'musicVideoType': instance.musicVideoType,
    };

WatchPlaylist _$WatchPlaylistFromJson(Map<String, dynamic> json) =>
    WatchPlaylist(
      params: json['params'] as String?,
      playlistId: json['playlistId'] as String?,
    );

Map<String, dynamic> _$WatchPlaylistToJson(WatchPlaylist instance) =>
    <String, dynamic>{
      'params': instance.params,
      'playlistId': instance.playlistId,
    };

Browse _$BrowseFromJson(Map<String, dynamic> json) => Browse(
      params: json['params'] as String?,
      browseId: json['browseId'] as String?,
      browseEndpointContextSupportedConfigs:
          json['browseEndpointContextSupportedConfigs'] == null
              ? null
              : BrowseEndpointContextSupportedConfigs.fromJson(
                  json['browseEndpointContextSupportedConfigs']
                      as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrowseToJson(Browse instance) => <String, dynamic>{
      'params': instance.params,
      'browseId': instance.browseId,
      'browseEndpointContextSupportedConfigs':
          instance.browseEndpointContextSupportedConfigs?.toJson(),
    };

BrowseEndpointContextSupportedConfigs
    _$BrowseEndpointContextSupportedConfigsFromJson(
            Map<String, dynamic> json) =>
        BrowseEndpointContextSupportedConfigs(
          browseEndpointContextMusicConfig:
              json['browseEndpointContextMusicConfig'] == null
                  ? null
                  : BrowseEndpointContextMusicConfig.fromJson(
                      json['browseEndpointContextMusicConfig']
                          as Map<String, dynamic>),
        );

Map<String, dynamic> _$BrowseEndpointContextSupportedConfigsToJson(
        BrowseEndpointContextSupportedConfigs instance) =>
    <String, dynamic>{
      'browseEndpointContextMusicConfig':
          instance.browseEndpointContextMusicConfig?.toJson(),
    };

BrowseEndpointContextMusicConfig _$BrowseEndpointContextMusicConfigFromJson(
        Map<String, dynamic> json) =>
    BrowseEndpointContextMusicConfig(
      pageType: json['pageType'] as String?,
    );

Map<String, dynamic> _$BrowseEndpointContextMusicConfigToJson(
        BrowseEndpointContextMusicConfig instance) =>
    <String, dynamic>{
      'pageType': instance.pageType,
    };

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      params: json['params'] as String?,
      query: json['query'] as String?,
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'params': instance.params,
      'query': instance.query,
    };

NavigationEndpoint _$NavigationEndpointFromJson(Map<String, dynamic> json) =>
    NavigationEndpoint(
      watchEndpoint: json['watchEndpoint'] == null
          ? null
          : Watch.fromJson(json['watchEndpoint'] as Map<String, dynamic>),
      watchPlaylistEndpoint: json['watchPlaylistEndpoint'] == null
          ? null
          : WatchPlaylist.fromJson(
              json['watchPlaylistEndpoint'] as Map<String, dynamic>),
      browseEndpoint: json['browseEndpoint'] == null
          ? null
          : Browse.fromJson(json['browseEndpoint'] as Map<String, dynamic>),
      searchEndpoint: json['searchEndpoint'] == null
          ? null
          : Search.fromJson(json['searchEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NavigationEndpointToJson(NavigationEndpoint instance) =>
    <String, dynamic>{
      'watchEndpoint': instance.watchEndpoint?.toJson(),
      'watchPlaylistEndpoint': instance.watchPlaylistEndpoint?.toJson(),
      'browseEndpoint': instance.browseEndpoint?.toJson(),
      'searchEndpoint': instance.searchEndpoint?.toJson(),
    };
