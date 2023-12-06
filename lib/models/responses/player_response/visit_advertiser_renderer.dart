import 'dart:convert';

import 'button_renderer.dart';

class VisitAdvertiserRenderer {
  ButtonRenderer? buttonRenderer;

  VisitAdvertiserRenderer({this.buttonRenderer});

  factory VisitAdvertiserRenderer.fromMap(Map<String, dynamic> data) {
    return VisitAdvertiserRenderer(
      buttonRenderer: data['buttonRenderer'] == null
          ? null
          : ButtonRenderer.fromMap(
              data['buttonRenderer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'buttonRenderer': buttonRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VisitAdvertiserRenderer].
  factory VisitAdvertiserRenderer.fromJson(String data) {
    return VisitAdvertiserRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VisitAdvertiserRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
