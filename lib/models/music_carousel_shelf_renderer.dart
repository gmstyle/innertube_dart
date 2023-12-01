import 'package:innertube_dart/models/button_renderer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_carousel_shelf_renderer.g.dart';

@JsonSerializable(explicitToJson: true)
class MusciCarouselShelfRenderer {}

@JsonSerializable(explicitToJson: true)
class Content {}

@JsonSerializable(explicitToJson: true)
class Header {}

@JsonSerializable(explicitToJson: true)
class MusicCarouselShelfBasicHeaderRenderer {}

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
