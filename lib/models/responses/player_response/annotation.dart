import 'dart:convert';

import 'player_annotations_expanded_renderer.dart';

class Annotation {
  PlayerAnnotationsExpandedRenderer? playerAnnotationsExpandedRenderer;

  Annotation({this.playerAnnotationsExpandedRenderer});

  factory Annotation.fromMap(Map<String, dynamic> data) => Annotation(
        playerAnnotationsExpandedRenderer:
            data['playerAnnotationsExpandedRenderer'] == null
                ? null
                : PlayerAnnotationsExpandedRenderer.fromMap(
                    data['playerAnnotationsExpandedRenderer']
                        as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'playerAnnotationsExpandedRenderer':
            playerAnnotationsExpandedRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Annotation].
  factory Annotation.fromJson(String data) {
    return Annotation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Annotation] to a JSON string.
  String toJson() => json.encode(toMap());
}
