import 'package:innertube_dart/models/continuation.dart';
import 'package:innertube_dart/models/navigation_endpoint.dart';
import 'package:innertube_dart/models/playlist_panel_video_renderer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'next_response.g.dart';

@JsonSerializable()
class NextResponse {
  final Contents? contents;

  NextResponse(this.contents);

  factory NextResponse.fromJson(Map<String, dynamic> json) =>
      _$NextResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NextResponseToJson(this);
}

@JsonSerializable()
class MusicQueueRenderer {
  final Content? content;

  MusicQueueRenderer(this.content);

  factory MusicQueueRenderer.fromJson(Map<String, dynamic> json) =>
      _$MusicQueueRendererFromJson(json);

  Map<String, dynamic> toJson() => _$MusicQueueRendererToJson(this);
}

@JsonSerializable()
class Content {
  final PlaylistPanelRenderer? playlistPanelRenderer;

  Content(this.playlistPanelRenderer);

  factory Content.fromJson(Map<String, dynamic> json) {
    json['playlistPanelRenderer'] ??= json['playlistPanelContinuation'];
    return _$ContentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class PlaylistPanelRenderer {
  final List<Content>? contents;
  final List<Continuation>? continuations;

  PlaylistPanelRenderer(this.contents, this.continuations);

  factory PlaylistPanelRenderer.fromJson(Map<String, dynamic> json) =>
      _$PlaylistPanelRendererFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistPanelRendererToJson(this);
}

@JsonSerializable()
class AutomixPreviewVideoRenderer {
  final Content? content;

  AutomixPreviewVideoRenderer(this.content);

  factory AutomixPreviewVideoRenderer.fromJson(Map<String, dynamic> json) =>
      _$AutomixPreviewVideoRendererFromJson(json);

  Map<String, dynamic> toJson() => _$AutomixPreviewVideoRendererToJson(this);
}

@JsonSerializable()
class Content {
  final PlaylistPanelVideoRenderer? playlistPanelVideoRenderer;
  final AutomixPreviewVideoRenderer? automixPreviewVideoRenderer;

  Content._(this.playlistPanelVideoRenderer, this.automixPreviewVideoRenderer);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class AutomixPlaylistVideoRenderer {
  final NavigationEndpoint? navigationEndpoint;

  AutomixPlaylistVideoRenderer(this.navigationEndpoint);

  factory AutomixPlaylistVideoRenderer.fromJson(Map<String, dynamic> json) =>
      _$AutomixPlaylistVideoRendererFromJson(json);

  Map<String, dynamic> toJson() => _$AutomixPlaylistVideoRendererToJson(this);
}

@JsonSerializable()
class Contents {
  final SingleColumnMusicWatchNextResultsRenderer?
      singleColumnMusicWatchNextResultsRenderer;

  Contents(this.singleColumnMusicWatchNextResultsRenderer);

  factory Contents.fromJson(Map<String, dynamic> json) =>
      _$ContentsFromJson(json);

  Map<String, dynamic> toJson() => _$ContentsToJson(this);
}

@JsonSerializable()
class SingleColumnMusicWatchNextResultsRenderer {
  final TabbedRenderer? tabbedRenderer;

  SingleColumnMusicWatchNextResultsRenderer(this.tabbedRenderer);

  factory SingleColumnMusicWatchNextResultsRenderer.fromJson(
          Map<String, dynamic> json) =>
      _$SingleColumnMusicWatchNextResultsRendererFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SingleColumnMusicWatchNextResultsRendererToJson(this);
}

@JsonSerializable()
class TabbedRenderer {
  final WatchNextTabbedResultsRenderer? watchNextTabbedResultsRenderer;

  TabbedRenderer(this.watchNextTabbedResultsRenderer);

  factory TabbedRenderer.fromJson(Map<String, dynamic> json) =>
      _$TabbedRendererFromJson(json);

  Map<String, dynamic> toJson() => _$TabbedRendererToJson(this);
}

@JsonSerializable()
class WatchNextTabbedResultsRenderer {
  final List<Tab>? tabs;

  WatchNextTabbedResultsRenderer(this.tabs);

  factory WatchNextTabbedResultsRenderer.fromJson(Map<String, dynamic> json) =>
      _$WatchNextTabbedResultsRendererFromJson(json);

  Map<String, dynamic> toJson() => _$WatchNextTabbedResultsRendererToJson(this);
}

@JsonSerializable()
class Tab {
  final TabRenderer? tabRenderer;

  Tab(this.tabRenderer);

  factory Tab.fromJson(Map<String, dynamic> json) => _$TabFromJson(json);

  Map<String, dynamic> toJson() => _$TabToJson(this);
}

@JsonSerializable()
class TabRenderer {
  final Content? content;
  final NavigationEndpoint? endpoint;
  final String? title;

  TabRenderer(this.content, this.endpoint, this.title);

  factory TabRenderer.fromJson(Map<String, dynamic> json) =>
      _$TabRendererFromJson(json);

  Map<String, dynamic> toJson() => _$TabRendererToJson(this);
}
