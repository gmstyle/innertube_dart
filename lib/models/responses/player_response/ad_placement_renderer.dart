import 'dart:convert';

import 'ad_slot_logging_data.dart';
import 'config.dart';
import 'renderer.dart';

class AdPlacementRenderer {
  Config? config;
  Renderer? renderer;
  AdSlotLoggingData? adSlotLoggingData;

  AdPlacementRenderer({this.config, this.renderer, this.adSlotLoggingData});

  factory AdPlacementRenderer.fromMap(Map<String, dynamic> data) {
    return AdPlacementRenderer(
      config: data['config'] == null
          ? null
          : Config.fromMap(data['config'] as Map<String, dynamic>),
      renderer: data['renderer'] == null
          ? null
          : Renderer.fromMap(data['renderer'] as Map<String, dynamic>),
      adSlotLoggingData: data['adSlotLoggingData'] == null
          ? null
          : AdSlotLoggingData.fromMap(
              data['adSlotLoggingData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'config': config?.toMap(),
        'renderer': renderer?.toMap(),
        'adSlotLoggingData': adSlotLoggingData?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdPlacementRenderer].
  factory AdPlacementRenderer.fromJson(String data) {
    return AdPlacementRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdPlacementRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
