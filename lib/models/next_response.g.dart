// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextResponse _$NextResponseFromJson(Map<String, dynamic> json) => NextResponse(
      json['contents'] == null
          ? null
          : Contents.fromJson(json['contents'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NextResponseToJson(NextResponse instance) =>
    <String, dynamic>{
      'contents': instance.contents?.toJson(),
    };

MusicQueueRenderer _$MusicQueueRendererFromJson(Map<String, dynamic> json) =>
    MusicQueueRenderer(
      json['content'] == null
          ? null
          : MusicQueueRendererContent.fromJson(
              json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicQueueRendererToJson(MusicQueueRenderer instance) =>
    <String, dynamic>{
      'content': instance.content?.toJson(),
    };

MusicQueueRendererContent _$MusicQueueRendererContentFromJson(
        Map<String, dynamic> json) =>
    MusicQueueRendererContent(
      json['playlistPanelRenderer'] == null
          ? null
          : PlaylistPanelRenderer.fromJson(
              json['playlistPanelRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicQueueRendererContentToJson(
        MusicQueueRendererContent instance) =>
    <String, dynamic>{
      'playlistPanelRenderer': instance.playlistPanelRenderer?.toJson(),
    };

PlaylistPanelRenderer _$PlaylistPanelRendererFromJson(
        Map<String, dynamic> json) =>
    PlaylistPanelRenderer(
      (json['contents'] as List<dynamic>?)
          ?.map((e) =>
              PlaylistPanelRendererContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['continuations'] as List<dynamic>?)
          ?.map((e) => Continuation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaylistPanelRendererToJson(
        PlaylistPanelRenderer instance) =>
    <String, dynamic>{
      'contents': instance.contents?.map((e) => e.toJson()).toList(),
      'continuations': instance.continuations?.map((e) => e.toJson()).toList(),
    };

PlaylistPanelRendererContent _$PlaylistPanelRendererContentFromJson(
        Map<String, dynamic> json) =>
    PlaylistPanelRendererContent(
      json['playlistPanelVideoRenderer'] == null
          ? null
          : PlaylistPanelVideoRenderer.fromJson(
              json['playlistPanelVideoRenderer'] as Map<String, dynamic>),
      json['automixPreviewVideoRenderer'] == null
          ? null
          : AutomixPreviewVideoRenderer.fromJson(
              json['automixPreviewVideoRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaylistPanelRendererContentToJson(
        PlaylistPanelRendererContent instance) =>
    <String, dynamic>{
      'playlistPanelVideoRenderer':
          instance.playlistPanelVideoRenderer?.toJson(),
      'automixPreviewVideoRenderer':
          instance.automixPreviewVideoRenderer?.toJson(),
    };

AutomixPreviewVideoRenderer _$AutomixPreviewVideoRendererFromJson(
        Map<String, dynamic> json) =>
    AutomixPreviewVideoRenderer(
      json['content'] == null
          ? null
          : AutomixPreviewContent.fromJson(
              json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AutomixPreviewVideoRendererToJson(
        AutomixPreviewVideoRenderer instance) =>
    <String, dynamic>{
      'content': instance.content?.toJson(),
    };

AutomixPreviewContent _$AutomixPreviewContentFromJson(
        Map<String, dynamic> json) =>
    AutomixPreviewContent(
      json['automixPlaylistVideoRenderer'] == null
          ? null
          : AutomixPlaylistVideoRenderer.fromJson(
              json['automixPlaylistVideoRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AutomixPreviewContentToJson(
        AutomixPreviewContent instance) =>
    <String, dynamic>{
      'automixPlaylistVideoRenderer':
          instance.automixPlaylistVideoRenderer?.toJson(),
    };

AutomixPlaylistVideoRenderer _$AutomixPlaylistVideoRendererFromJson(
        Map<String, dynamic> json) =>
    AutomixPlaylistVideoRenderer(
      json['navigationEndpoint'] == null
          ? null
          : NavigationEndpoint.fromJson(
              json['navigationEndpoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AutomixPlaylistVideoRendererToJson(
        AutomixPlaylistVideoRenderer instance) =>
    <String, dynamic>{
      'navigationEndpoint': instance.navigationEndpoint?.toJson(),
    };

Contents _$ContentsFromJson(Map<String, dynamic> json) => Contents(
      json['singleColumnMusicWatchNextResultsRenderer'] == null
          ? null
          : SingleColumnMusicWatchNextResultsRenderer.fromJson(
              json['singleColumnMusicWatchNextResultsRenderer']
                  as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentsToJson(Contents instance) => <String, dynamic>{
      'singleColumnMusicWatchNextResultsRenderer':
          instance.singleColumnMusicWatchNextResultsRenderer?.toJson(),
    };

SingleColumnMusicWatchNextResultsRenderer
    _$SingleColumnMusicWatchNextResultsRendererFromJson(
            Map<String, dynamic> json) =>
        SingleColumnMusicWatchNextResultsRenderer(
          json['tabbedRenderer'] == null
              ? null
              : TabbedRenderer.fromJson(
                  json['tabbedRenderer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SingleColumnMusicWatchNextResultsRendererToJson(
        SingleColumnMusicWatchNextResultsRenderer instance) =>
    <String, dynamic>{
      'tabbedRenderer': instance.tabbedRenderer?.toJson(),
    };

TabbedRenderer _$TabbedRendererFromJson(Map<String, dynamic> json) =>
    TabbedRenderer(
      json['watchNextTabbedResultsRenderer'] == null
          ? null
          : WatchNextTabbedResultsRenderer.fromJson(
              json['watchNextTabbedResultsRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TabbedRendererToJson(TabbedRenderer instance) =>
    <String, dynamic>{
      'watchNextTabbedResultsRenderer':
          instance.watchNextTabbedResultsRenderer?.toJson(),
    };

WatchNextTabbedResultsRenderer _$WatchNextTabbedResultsRendererFromJson(
        Map<String, dynamic> json) =>
    WatchNextTabbedResultsRenderer(
      (json['tabs'] as List<dynamic>?)
          ?.map((e) => Tab.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WatchNextTabbedResultsRendererToJson(
        WatchNextTabbedResultsRenderer instance) =>
    <String, dynamic>{
      'tabs': instance.tabs?.map((e) => e.toJson()).toList(),
    };

Tab _$TabFromJson(Map<String, dynamic> json) => Tab(
      json['tabRenderer'] == null
          ? null
          : TabRenderer.fromJson(json['tabRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TabToJson(Tab instance) => <String, dynamic>{
      'tabRenderer': instance.tabRenderer?.toJson(),
    };

TabRenderer _$TabRendererFromJson(Map<String, dynamic> json) => TabRenderer(
      json['content'] == null
          ? null
          : TabContent.fromJson(json['content'] as Map<String, dynamic>),
      json['endpoint'] == null
          ? null
          : NavigationEndpoint.fromJson(
              json['endpoint'] as Map<String, dynamic>),
      json['title'] as String?,
    );

Map<String, dynamic> _$TabRendererToJson(TabRenderer instance) =>
    <String, dynamic>{
      'content': instance.content?.toJson(),
      'endpoint': instance.endpoint?.toJson(),
      'title': instance.title,
    };

TabContent _$TabContentFromJson(Map<String, dynamic> json) => TabContent(
      json['musicQueueRenderer'] == null
          ? null
          : MusicQueueRenderer.fromJson(
              json['musicQueueRenderer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TabContentToJson(TabContent instance) =>
    <String, dynamic>{
      'musicQueueRenderer': instance.musicQueueRenderer?.toJson(),
    };
