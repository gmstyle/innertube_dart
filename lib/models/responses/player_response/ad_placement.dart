import 'dart:convert';

import 'ad_placement_renderer.dart';

class AdPlacement {
  AdPlacementRenderer? adPlacementRenderer;

  AdPlacement({this.adPlacementRenderer});

  factory AdPlacement.fromMap(Map<String, dynamic> data) => AdPlacement(
        adPlacementRenderer: data['adPlacementRenderer'] == null
            ? null
            : AdPlacementRenderer.fromMap(
                data['adPlacementRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'adPlacementRenderer': adPlacementRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdPlacement].
  factory AdPlacement.fromJson(String data) {
    return AdPlacement.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdPlacement] to a JSON string.
  String toJson() => json.encode(toMap());
}
