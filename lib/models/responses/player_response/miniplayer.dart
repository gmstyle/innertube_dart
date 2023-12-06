import 'dart:convert';

import 'miniplayer_renderer.dart';

class Miniplayer {
  MiniplayerRenderer? miniplayerRenderer;

  Miniplayer({this.miniplayerRenderer});

  factory Miniplayer.fromMap(Map<String, dynamic> data) => Miniplayer(
        miniplayerRenderer: data['miniplayerRenderer'] == null
            ? null
            : MiniplayerRenderer.fromMap(
                data['miniplayerRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'miniplayerRenderer': miniplayerRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Miniplayer].
  factory Miniplayer.fromJson(String data) {
    return Miniplayer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Miniplayer] to a JSON string.
  String toJson() => json.encode(toMap());
}
