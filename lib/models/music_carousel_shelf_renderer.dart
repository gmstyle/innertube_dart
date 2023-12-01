import 'package:innertube_dart/models/button_renderer.dart';

class MusciCarouselShelfRenderer {}

class Content {}

class Header {}

class MusicCarouselShelfBasicHeaderRenderer {}

class MoreContentButton {
  final ButtonRenderer? buttonRenderer;

  MoreContentButton({this.buttonRenderer});

  factory MoreContentButton.fromJson(Map<String, dynamic> json) {
    return MoreContentButton(
      buttonRenderer: json['buttonRenderer'] != null
          ? ButtonRenderer.fromJson(json['buttonRenderer'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buttonRenderer': buttonRenderer?.toJson(),
    };
  }
}
