import 'package:innertube_dart/models/navigation_endpoint.dart';
import 'package:innertube_dart/models/runs.dart';
import 'package:innertube_dart/models/thumbnail_renderer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_two_row_item_renderer.g.dart';

@JsonSerializable(explicitToJson: true)
class MusicTwoRowItemRenderer {
  final NavigationEndpoint? navigationEndpoint;
  final ThumbnailRenderer? thumbnailRenderer;
  final Runs? title;
  final Runs? subtitle;

  MusicTwoRowItemRenderer({
    this.navigationEndpoint,
    this.thumbnailRenderer,
    this.title,
    this.subtitle,
  });

  factory MusicTwoRowItemRenderer.fromJson(Map<String, dynamic> json) {
    return _$MusicTwoRowItemRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusicTwoRowItemRendererToJson(this);
  }
}
