import 'dart:convert';

import 'ad_preview_renderer.dart';

class SkipOrPreviewRenderer {
  AdPreviewRenderer? adPreviewRenderer;

  SkipOrPreviewRenderer({this.adPreviewRenderer});

  factory SkipOrPreviewRenderer.fromMap(Map<String, dynamic> data) {
    return SkipOrPreviewRenderer(
      adPreviewRenderer: data['adPreviewRenderer'] == null
          ? null
          : AdPreviewRenderer.fromMap(
              data['adPreviewRenderer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'adPreviewRenderer': adPreviewRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SkipOrPreviewRenderer].
  factory SkipOrPreviewRenderer.fromJson(String data) {
    return SkipOrPreviewRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SkipOrPreviewRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
