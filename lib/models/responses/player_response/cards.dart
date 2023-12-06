import 'dart:convert';

import 'card_collection_renderer.dart';

class Cards {
  CardCollectionRenderer? cardCollectionRenderer;

  Cards({this.cardCollectionRenderer});

  factory Cards.fromMap(Map<String, dynamic> data) => Cards(
        cardCollectionRenderer: data['cardCollectionRenderer'] == null
            ? null
            : CardCollectionRenderer.fromMap(
                data['cardCollectionRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'cardCollectionRenderer': cardCollectionRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cards].
  factory Cards.fromJson(String data) {
    return Cards.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cards] to a JSON string.
  String toJson() => json.encode(toMap());
}
