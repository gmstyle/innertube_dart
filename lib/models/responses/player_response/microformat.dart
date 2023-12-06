import 'dart:convert';

import 'player_microformat_renderer.dart';

class Microformat {
  PlayerMicroformatRenderer? playerMicroformatRenderer;

  Microformat({this.playerMicroformatRenderer});

  factory Microformat.fromMap(Map<String, dynamic> data) => Microformat(
        playerMicroformatRenderer: data['playerMicroformatRenderer'] == null
            ? null
            : PlayerMicroformatRenderer.fromMap(
                data['playerMicroformatRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'playerMicroformatRenderer': playerMicroformatRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Microformat].
  factory Microformat.fromJson(String data) {
    return Microformat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Microformat] to a JSON string.
  String toJson() => json.encode(toMap());
}
