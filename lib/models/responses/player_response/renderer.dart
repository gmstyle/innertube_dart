import 'dart:convert';

import 'linear_ad_sequence_renderer.dart';

class Renderer {
  LinearAdSequenceRenderer? linearAdSequenceRenderer;

  Renderer({this.linearAdSequenceRenderer});

  factory Renderer.fromMap(Map<String, dynamic> data) => Renderer(
        linearAdSequenceRenderer: data['linearAdSequenceRenderer'] == null
            ? null
            : LinearAdSequenceRenderer.fromMap(
                data['linearAdSequenceRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'linearAdSequenceRenderer': linearAdSequenceRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Renderer].
  factory Renderer.fromJson(String data) {
    return Renderer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Renderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
