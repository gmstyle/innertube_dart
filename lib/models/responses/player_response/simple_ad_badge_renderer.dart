import 'dart:convert';

import 'text.dart';

class SimpleAdBadgeRenderer {
  Text? text;
  String? trackingParams;

  SimpleAdBadgeRenderer({this.text, this.trackingParams});

  factory SimpleAdBadgeRenderer.fromMap(Map<String, dynamic> data) {
    return SimpleAdBadgeRenderer(
      text: data['text'] == null
          ? null
          : Text.fromMap(data['text'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'text': text?.toMap(),
        'trackingParams': trackingParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SimpleAdBadgeRenderer].
  factory SimpleAdBadgeRenderer.fromJson(String data) {
    return SimpleAdBadgeRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SimpleAdBadgeRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
