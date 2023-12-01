import 'package:innertube_dart/models/navigation_endpoint.dart';
import 'package:innertube_dart/models/runs.dart';
import 'package:innertube_dart/models/thumbnail_renderer.dart'
    as thumbnailRenderer;
import 'package:json_annotation/json_annotation.dart';

part 'playlist_panel_video_renderer.g.dart';

@JsonSerializable()
class PlaylistPanelVideoRenderer {
  final Runs? title;
  final Runs? longByLineText;
  final Runs? shortByLineText;
  final Runs? lengthText;
  final NavigationEndpoint? navigationEndpoint;
  final thumbnailRenderer.Thumbnail? thumbnail;

  PlaylistPanelVideoRenderer({
    this.title,
    this.longByLineText,
    this.shortByLineText,
    this.lengthText,
    this.navigationEndpoint,
    this.thumbnail,
  });

  factory PlaylistPanelVideoRenderer.fromJson(Map<String, dynamic> json) {
    return _$PlaylistPanelVideoRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlaylistPanelVideoRendererToJson(this);
  }
}
