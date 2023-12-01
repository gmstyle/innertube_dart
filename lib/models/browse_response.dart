import 'package:innertube_dart/models/button_renderer.dart';
import 'package:innertube_dart/models/section_list_renderer.dart';
import 'package:innertube_dart/models/tabs.dart';
import 'package:innertube_dart/models/thumbnail_renderer.dart';
import 'package:json_annotation/json_annotation.dart';

import 'runs.dart';

part 'browse_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BrowseResponse {
  final Contents? contents;
  final Header? header;
  final Microformat? microformat;

  BrowseResponse(this.contents, this.header, this.microformat);

  factory BrowseResponse.fromJson(Map<String, dynamic> json) =>
      _$BrowseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BrowseResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Contents {
  final Tabs? singleColumnBrowseResultsRenderer;
  final SectionListRenderer? sectionListRenderer;

  Contents(this.singleColumnBrowseResultsRenderer, this.sectionListRenderer);

  factory Contents.fromJson(Map<String, dynamic> json) =>
      _$ContentsFromJson(json);

  Map<String, dynamic> toJson() => _$ContentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Header {
  final MusicImmersiveHeaderRenderer? musicImmersiveHeaderRenderer;
  final MusicDetailHeaderRenderer? musicDetailHeaderRenderer;

  Header(this.musicImmersiveHeaderRenderer, this.musicDetailHeaderRenderer);

  factory Header.fromJson(Map<String, dynamic> json) {
    json['musicImmersiveHeaderRenderer'] ??= json['musicVisualHeaderRenderer'];
    return _$HeaderFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MusicDetailHeaderRenderer {
  final Runs? title;
  final Runs? subtitle;
  final Runs? secondSubtitle;
  final ThumbnailRenderer? thumbnail;

  MusicDetailHeaderRenderer(
      this.title, this.subtitle, this.secondSubtitle, this.thumbnail);

  factory MusicDetailHeaderRenderer.fromJson(Map<String, dynamic> json) =>
      _$MusicDetailHeaderRendererFromJson(json);

  Map<String, dynamic> toJson() => _$MusicDetailHeaderRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MusicImmersiveHeaderRenderer {
  final Runs? description;
  final PlayButton? playButton;
  final StartRadioButton? startRadioButton;
  final ThumbnailRenderer? thumbnail;
  final ThumbnailRenderer? foregroundThumbnail;
  final Runs? title;

  MusicImmersiveHeaderRenderer(
      this.description,
      this.playButton,
      this.startRadioButton,
      this.thumbnail,
      this.foregroundThumbnail,
      this.title);

  factory MusicImmersiveHeaderRenderer.fromJson(Map<String, dynamic> json) =>
      _$MusicImmersiveHeaderRendererFromJson(json);

  Map<String, dynamic> toJson() => _$MusicImmersiveHeaderRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PlayButton {
  final ButtonRenderer? buttonRenderer;

  PlayButton(this.buttonRenderer);

  factory PlayButton.fromJson(Map<String, dynamic> json) =>
      _$PlayButtonFromJson(json);

  Map<String, dynamic> toJson() => _$PlayButtonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StartRadioButton {
  final ButtonRenderer? buttonRenderer;

  StartRadioButton(this.buttonRenderer);

  factory StartRadioButton.fromJson(Map<String, dynamic> json) =>
      _$StartRadioButtonFromJson(json);

  Map<String, dynamic> toJson() => _$StartRadioButtonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Microformat {
  final MicroformatDataRenderer? microformatDataRenderer;

  Microformat(this.microformatDataRenderer);

  factory Microformat.fromJson(Map<String, dynamic> json) =>
      _$MicroformatFromJson(json);

  Map<String, dynamic> toJson() => _$MicroformatToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MicroformatDataRenderer {
  final String? urlCanonical;

  MicroformatDataRenderer(this.urlCanonical);

  factory MicroformatDataRenderer.fromJson(Map<String, dynamic> json) =>
      _$MicroformatDataRendererFromJson(json);

  Map<String, dynamic> toJson() => _$MicroformatDataRendererToJson(this);
}
