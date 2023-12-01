import 'package:innertube_dart/models/continuation.dart';
import 'package:innertube_dart/models/navigation_endpoint.dart';
import 'package:innertube_dart/models/playlist_panel_video_renderer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'next_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NextResponse {
  final Contents? contents;

  NextResponse(this.contents);

  factory NextResponse.fromJson(Map<String, dynamic> json) =>
      _$NextResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NextResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MusicQueueRenderer {
  final MusicQueueRendererContent? content;

  MusicQueueRenderer(this.content);

  factory MusicQueueRenderer.fromJson(Map<String, dynamic> json) {
    json['playlistPanelRenderer'] ??= json['playlistPanelContinuation'];
    return _$MusicQueueRendererFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MusicQueueRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MusicQueueRendererContent {
  final PlaylistPanelRenderer? playlistPanelRenderer;

  MusicQueueRendererContent(this.playlistPanelRenderer);

  factory MusicQueueRendererContent.fromJson(Map<String, dynamic> json) {
    json['playlistPanelRenderer'] ??= json['playlistPanelContinuation'];
    return _$MusicQueueRendererContentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MusicQueueRendererContentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PlaylistPanelRenderer {
  final List<PlaylistPanelContent>? contents;
  final List<Continuation>? continuations;

  PlaylistPanelRenderer(this.contents, this.continuations);

  factory PlaylistPanelRenderer.fromJson(Map<String, dynamic> json) =>
      _$PlaylistPanelRendererFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistPanelRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PlaylistPanelContent {
  final PlaylistPanelVideoRenderer? playlistPanelVideoRenderer;
  final AutomixPreviewVideoRenderer? automixPreviewVideoRenderer;

  PlaylistPanelContent(
      this.playlistPanelVideoRenderer, this.automixPreviewVideoRenderer);

  factory PlaylistPanelContent.fromJson(Map<String, dynamic> json) {
    return _$PlaylistPanelContentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlaylistPanelContentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AutomixPreviewVideoRenderer {
  final AutomixPreviewContent? content;

  AutomixPreviewVideoRenderer(this.content);

  factory AutomixPreviewVideoRenderer.fromJson(Map<String, dynamic> json) =>
      _$AutomixPreviewVideoRendererFromJson(json);

  Map<String, dynamic> toJson() => _$AutomixPreviewVideoRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AutomixPreviewContent {
  final AutomixPlaylistVideoRenderer? automixPlaylistVideoRenderer;

  AutomixPreviewContent(this.automixPlaylistVideoRenderer);

  factory AutomixPreviewContent.fromJson(Map<String, dynamic> json) =>
      _$AutomixPreviewContentFromJson(json);

  Map<String, dynamic> toJson() => _$AutomixPreviewContentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AutomixPlaylistVideoRenderer {
  final NavigationEndpoint? navigationEndpoint;

  AutomixPlaylistVideoRenderer(this.navigationEndpoint);

  factory AutomixPlaylistVideoRenderer.fromJson(Map<String, dynamic> json) =>
      _$AutomixPlaylistVideoRendererFromJson(json);

  Map<String, dynamic> toJson() => _$AutomixPlaylistVideoRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Contents {
  final SingleColumnMusicWatchNextResultsRenderer?
      singleColumnMusicWatchNextResultsRenderer;

  Contents(this.singleColumnMusicWatchNextResultsRenderer);

  factory Contents.fromJson(Map<String, dynamic> json) =>
      _$ContentsFromJson(json);

  Map<String, dynamic> toJson() => _$ContentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SingleColumnMusicWatchNextResultsRenderer {
  final TabbedRenderer? tabbedRenderer;

  SingleColumnMusicWatchNextResultsRenderer(this.tabbedRenderer);

  factory SingleColumnMusicWatchNextResultsRenderer.fromJson(
          Map<String, dynamic> json) =>
      _$SingleColumnMusicWatchNextResultsRendererFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SingleColumnMusicWatchNextResultsRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TabbedRenderer {
  final WatchNextTabbedResultsRenderer? watchNextTabbedResultsRenderer;

  TabbedRenderer(this.watchNextTabbedResultsRenderer);

  factory TabbedRenderer.fromJson(Map<String, dynamic> json) =>
      _$TabbedRendererFromJson(json);

  Map<String, dynamic> toJson() => _$TabbedRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WatchNextTabbedResultsRenderer {
  final List<Tab>? tabs;

  WatchNextTabbedResultsRenderer(this.tabs);

  factory WatchNextTabbedResultsRenderer.fromJson(Map<String, dynamic> json) =>
      _$WatchNextTabbedResultsRendererFromJson(json);

  Map<String, dynamic> toJson() => _$WatchNextTabbedResultsRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Tab {
  final TabRenderer? tabRenderer;

  Tab(this.tabRenderer);

  factory Tab.fromJson(Map<String, dynamic> json) => _$TabFromJson(json);

  Map<String, dynamic> toJson() => _$TabToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TabRenderer {
  final TabContent? content;
  final NavigationEndpoint? endpoint;
  final String? title;

  TabRenderer(this.content, this.endpoint, this.title);

  factory TabRenderer.fromJson(Map<String, dynamic> json) =>
      _$TabRendererFromJson(json);

  Map<String, dynamic> toJson() => _$TabRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TabContent {
  final MusicQueueRenderer? musicQueueRenderer;

  TabContent(this.musicQueueRenderer);

  factory TabContent.fromJson(Map<String, dynamic> json) =>
      _$TabContentFromJson(json);

  Map<String, dynamic> toJson() => _$TabContentToJson(this);
}
