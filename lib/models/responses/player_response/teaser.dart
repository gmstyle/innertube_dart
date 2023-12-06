import 'dart:convert';

import 'simple_card_teaser_renderer.dart';

class Teaser {
  SimpleCardTeaserRenderer? simpleCardTeaserRenderer;

  Teaser({this.simpleCardTeaserRenderer});

  factory Teaser.fromMap(Map<String, dynamic> data) => Teaser(
        simpleCardTeaserRenderer: data['simpleCardTeaserRenderer'] == null
            ? null
            : SimpleCardTeaserRenderer.fromMap(
                data['simpleCardTeaserRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'simpleCardTeaserRenderer': simpleCardTeaserRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Teaser].
  factory Teaser.fromJson(String data) {
    return Teaser.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Teaser] to a JSON string.
  String toJson() => json.encode(toMap());
}
