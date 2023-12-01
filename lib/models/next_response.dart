import 'package:innertube_dart/models/navigation_endpoint.dart';

class NextResponse {}

class MusicQUeueRenderer {}

class Content {
  final PlaylistPanelRenderer? playlistPanelRenderer;

  Content({
    this.playlistPanelRenderer,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      playlistPanelRenderer: json['playlistPanelRenderer'] != null
          ? PlaylistPanelRenderer.fromJson(json['playlistPanelRenderer'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playlistPanelRenderer': playlistPanelRenderer?.toJson(),
    };
  }
}

class Contents {}

class PlaylistPanelRenderer {}

class AutomixPreviewVideoRenderer {}

class AutoMixPlaylistVideoRenderer {
  final NavigationEndpoint? navigationEndpoint;

  AutoMixPlaylistVideoRenderer({
    this.navigationEndpoint,
  });

  factory AutoMixPlaylistVideoRenderer.fromJson(Map<String, dynamic> json) {
    return AutoMixPlaylistVideoRenderer(
      navigationEndpoint: json['navigationEndpoint'] != null
          ? NavigationEndpoint.fromJson(json['navigationEndpoint'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'navigationEndpoint': navigationEndpoint?.toJson(),
    };
  }
}
