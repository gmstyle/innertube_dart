import 'package:innertube_dart/models/button_renderer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_carousel_shelf_renderer.g.dart';

@JsonSerializable()
class MusciCarouselShelfRenderer {}

@JsonSerializable()
class Content {}

@JsonSerializable()
class Header {}

@JsonSerializable()
class MusicCarouselShelfBasicHeaderRenderer {}

@JsonSerializable()
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
