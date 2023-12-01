import 'package:innertube_dart/models/continuation.dart';
import 'package:innertube_dart/models/grid_renderer.dart';
import 'package:innertube_dart/models/music_carousel_shelf_renderer.dart';
import 'package:innertube_dart/models/music_shelf_renderer.dart';
import 'package:innertube_dart/models/runs.dart';

class SectionListRenderer {
  final List<Content>? contents;
  final List<Continuation>? continuations;

  SectionListRenderer({
    this.contents,
    this.continuations,
  });

  factory SectionListRenderer.fromJson(Map<String, dynamic> json) {
    return SectionListRenderer(
      contents: json['contents'] != null
          ? (json['contents'] as List).map((i) => Content.fromJson(i)).toList()
          : [],
      continuations: json['continuations'] != null
          ? (json['continuations'] as List)
              .map((i) => Continuation.fromJson(i))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contents': contents?.map((e) => e.toJson()).toList(),
      'continuations': continuations?.map((e) => e.toJson()).toList(),
    };
  }
}

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
    return Content(
      musicCarouselShelfRenderer:
          json['musicImmersiveCarouselShelfRenderer'] != null
              ? MusciCarouselShelfRenderer.fromJson(
                  json['musicImmersiveCarouselShelfRenderer'])
              : null,
      musicShelfRenderer: json['musicPlaylistShelfRenderer'] != null
          ? MusicShelfRenderer.fromJson(json['musicPlaylistShelfRenderer'])
          : null,
      gridRenderer: json['gridRenderer'] != null
          ? GridRenderer.fromJson(json['gridRenderer'])
          : null,
      musicDescriptionShelfRenderer:
          json['musicDescriptionShelfRenderer'] != null
              ? MusicDescriptionShelfRenderer.fromJson(
                  json['musicDescriptionShelfRenderer'])
              : null,
    );
  }
}

class MusicDescriptionShelfRenderer {
  final Runs? description;

  MusicDescriptionShelfRenderer({
    this.description,
  });

  factory MusicDescriptionShelfRenderer.fromJson(Map<String, dynamic> json) {
    return MusicDescriptionShelfRenderer(
      description: json['description'] != null
          ? Runs.fromJson(json['description'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description?.toJson(),
    };
  }
}
