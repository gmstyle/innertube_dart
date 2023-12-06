import 'dart:convert';

import 'ad_placement_config.dart';

class Config {
  AdPlacementConfig? adPlacementConfig;

  Config({this.adPlacementConfig});

  factory Config.fromMap(Map<String, dynamic> data) => Config(
        adPlacementConfig: data['adPlacementConfig'] == null
            ? null
            : AdPlacementConfig.fromMap(
                data['adPlacementConfig'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'adPlacementConfig': adPlacementConfig?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Config].
  factory Config.fromJson(String data) {
    return Config.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Config] to a JSON string.
  String toJson() => json.encode(toMap());
}
