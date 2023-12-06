import 'dart:convert';

import 'card_renderer.dart';

class Card {
  CardRenderer? cardRenderer;

  Card({this.cardRenderer});

  factory Card.fromMap(Map<String, dynamic> data) => Card(
        cardRenderer: data['cardRenderer'] == null
            ? null
            : CardRenderer.fromMap(
                data['cardRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'cardRenderer': cardRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Card].
  factory Card.fromJson(String data) {
    return Card.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Card] to a JSON string.
  String toJson() => json.encode(toMap());
}
