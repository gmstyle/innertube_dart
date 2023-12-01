import 'package:innertube_dart/models/continuation.dart';
import 'package:innertube_dart/models/music_responsive_list_item_renderer.dart';
import 'package:innertube_dart/models/navigation_endpoint.dart';
import 'package:innertube_dart/models/runs.dart';
import 'package:innertube_dart/models/thumbnail.dart';
import 'package:innertube_dart/utils/pair.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_shelf_renderer.g.dart';

@JsonSerializable(explicitToJson: true)
class MusicShelfRenderer {
  final NavigationEndpoint? navigationEndpoint;
  final List<Content>? contents;
  final List<Continuation> continuations;
  final Runs? title;

  MusicShelfRenderer({
    this.navigationEndpoint,
    this.contents,
    this.continuations = const [],
    this.title,
  });

  factory MusicShelfRenderer.fromJson(Map<String, dynamic> json) {
    return _$MusicShelfRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusicShelfRendererToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Content {
  final MusicResponsiveListItemRenderer? musicResponsiveListItemRenderer;

  Content({
    this.musicResponsiveListItemRenderer,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return _$ContentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContentToJson(this);
  }

  Pair<List<Run>, List<List<Run>>> get runs {
    return Pair(
        musicResponsiveListItemRenderer?.flexColumns?.first
                .musicResponsiveListItemFlexColumnRenderer?.text?.runs ??
            [],
        musicResponsiveListItemRenderer?.flexColumns?.last
                .musicResponsiveListItemFlexColumnRenderer?.text
                ?.splitBySeparator() ??
            []);
  }

  Thumbnail? get thumbnail {
    return musicResponsiveListItemRenderer
        ?.thumbnail?.musicThumbnailRenderer?.thumbnail?.thumbnails.firstOrNull;
  }
}
