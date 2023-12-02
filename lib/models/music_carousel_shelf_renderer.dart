import 'package:innertube_dart/models/button_renderer.dart';
import 'package:innertube_dart/models/music_responsive_list_item_renderer.dart';
import 'package:innertube_dart/models/music_two_row_item_renderer.dart';
import 'package:innertube_dart/models/runs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_carousel_shelf_renderer.g.dart';

@JsonSerializable(explicitToJson: true)
class MusciCarouselShelfRenderer {
  final Header? header;
  final List<Content>? contents;

  MusciCarouselShelfRenderer({this.header, this.contents});

  factory MusciCarouselShelfRenderer.fromJson(Map<String, dynamic> json) {
    return _$MusciCarouselShelfRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusciCarouselShelfRendererToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Content {
  final MusicTwoRowItemRenderer? musicTwoRowItemRenderer;
  final MusicResponsiveListItemRenderer? musicResponsiveListItemRenderer;

  Content({this.musicTwoRowItemRenderer, this.musicResponsiveListItemRenderer});

  factory Content.fromJson(Map<String, dynamic> json) {
    return _$ContentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContentToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class Header {
  final MusicTwoRowItemRenderer? musicTwoRowItemRenderer;
  final MusicResponsiveListItemRenderer? musicResponsiveListItemRenderer;
  final MusicCarouselShelfBasicHeaderRenderer?
      musicCarouselShelfBasicHeaderRenderer;

  Header(
      {this.musicTwoRowItemRenderer,
      this.musicResponsiveListItemRenderer,
      this.musicCarouselShelfBasicHeaderRenderer});

  factory Header.fromJson(Map<String, dynamic> json) {
    return _$HeaderFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HeaderToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class MusicCarouselShelfBasicHeaderRenderer {
  final MoreContentButton? moreContentButton;
  final Runs? title;
  final Runs? strapline;

  MusicCarouselShelfBasicHeaderRenderer(
      {this.moreContentButton, this.title, this.strapline});

  factory MusicCarouselShelfBasicHeaderRenderer.fromJson(
      Map<String, dynamic> json) {
    return _$MusicCarouselShelfBasicHeaderRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusicCarouselShelfBasicHeaderRendererToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class MoreContentButton {
  final ButtonRenderer? buttonRenderer;

  MoreContentButton({this.buttonRenderer});

  factory MoreContentButton.fromJson(Map<String, dynamic> json) {
    return _$MoreContentButtonFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MoreContentButtonToJson(this);
  }
}
