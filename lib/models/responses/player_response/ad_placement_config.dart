import 'dart:convert';

import 'ad_time_offset.dart';

class AdPlacementConfig {
  String? kind;
  AdTimeOffset? adTimeOffset;
  bool? hideCueRangeMarker;

  AdPlacementConfig({
    this.kind,
    this.adTimeOffset,
    this.hideCueRangeMarker,
  });

  factory AdPlacementConfig.fromMap(Map<String, dynamic> data) {
    return AdPlacementConfig(
      kind: data['kind'] as String?,
      adTimeOffset: data['adTimeOffset'] == null
          ? null
          : AdTimeOffset.fromMap(data['adTimeOffset'] as Map<String, dynamic>),
      hideCueRangeMarker: data['hideCueRangeMarker'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'kind': kind,
        'adTimeOffset': adTimeOffset?.toMap(),
        'hideCueRangeMarker': hideCueRangeMarker,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdPlacementConfig].
  factory AdPlacementConfig.fromJson(String data) {
    return AdPlacementConfig.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdPlacementConfig] to a JSON string.
  String toJson() => json.encode(toMap());
}
