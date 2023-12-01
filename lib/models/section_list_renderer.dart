import 'package:innertube_dart/models/continuation.dart';
import 'package:innertube_dart/models/grid_renderer.dart';
import 'package:innertube_dart/models/music_carousel_shelf_renderer.dart';
import 'package:innertube_dart/models/music_shelf_renderer.dart';
import 'package:innertube_dart/models/runs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_list_renderer.g.dart';

@JsonSerializable()
class SectionListRenderer {
  final List<Content>? contents;
  final List<Continuation>? continuations;

  SectionListRenderer({
    this.contents,
    this.continuations,
  });

  factory SectionListRenderer.fromJson(Map<String, dynamic> json) {
    return _$SectionListRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SectionListRendererToJson(this);
  }
}

@JsonSerializable()
class Content {
  final MusciCarouselShelfRenderer? musicCarouselShelfRenderer;
  final MusicShelfRenderer? musicShelfRenderer;
  final GridRenderer? gridRenderer;
  final MusicDescriptionShelfRenderer? musicDescriptionShelfRenderer;

  Content({
    this.musicCarouselShelfRenderer,
    this.musicShelfRenderer,
    this.gridRenderer,
    this.musicDescriptionShelfRenderer,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    json['musicCarouselShelfRenderer'] ??=
        json['musicImmersiveCarouselShelfRenderer'];
    json['musicShelfRenderer'] ??= json['musicPlaylistShelfRenderer'];

    return _$ContentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContentToJson(this);
  }
}

@JsonSerializable()
class MusicDescriptionShelfRenderer {
  final Runs? description;

  MusicDescriptionShelfRenderer({
    this.description,
  });

  factory MusicDescriptionShelfRenderer.fromJson(Map<String, dynamic> json) {
    return _$MusicDescriptionShelfRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusicDescriptionShelfRendererToJson(this);
  }
}
