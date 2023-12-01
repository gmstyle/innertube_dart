import 'package:innertube_dart/models/navigation_endpoint.dart';
import 'package:innertube_dart/models/runs.dart';
import 'package:innertube_dart/models/thumbnail_renderer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_responsive_list_item_renderer.g.dart';

@JsonSerializable(explicitToJson: true)
class MusicResponsiveListItemRenderer {
  final List<FlexColumn>? fixedColumns;
  final List<FlexColumn>? flexColumns;
  final ThumbnailRenderer? thumbnail;
  final NavigationEndpoint? navigationEndpoint;

  MusicResponsiveListItemRenderer({
    this.fixedColumns,
    this.flexColumns,
    this.thumbnail,
    this.navigationEndpoint,
  });

  factory MusicResponsiveListItemRenderer.fromJson(Map<String, dynamic> json) {
    return _$MusicResponsiveListItemRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusicResponsiveListItemRendererToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class FlexColumn {
  final MusicResponsiveListItemFlexColumnRenderer?
      musicResponsiveListItemFlexColumnRenderer;

  FlexColumn({
    this.musicResponsiveListItemFlexColumnRenderer,
  });

  factory FlexColumn.fromJson(Map<String, dynamic> json) {
    json['musicResponsiveListItemFlexColumnRenderer'] ??=
        json['musicResponsiveListItemFixedColumnRenderer'];
    return _$FlexColumnFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FlexColumnToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class MusicResponsiveListItemFlexColumnRenderer {
  final Runs? text;

  MusicResponsiveListItemFlexColumnRenderer({
    this.text,
  });

  factory MusicResponsiveListItemFlexColumnRenderer.fromJson(
      Map<String, dynamic> json) {
    return _$MusicResponsiveListItemFlexColumnRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusicResponsiveListItemFlexColumnRendererToJson(this);
  }
}
