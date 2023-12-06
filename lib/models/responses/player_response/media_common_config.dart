import 'dart:convert';

import 'dynamic_readahead_config.dart';

class MediaCommonConfig {
  DynamicReadaheadConfig? dynamicReadaheadConfig;

  MediaCommonConfig({this.dynamicReadaheadConfig});

  factory MediaCommonConfig.fromMap(Map<String, dynamic> data) {
    return MediaCommonConfig(
      dynamicReadaheadConfig: data['dynamicReadaheadConfig'] == null
          ? null
          : DynamicReadaheadConfig.fromMap(
              data['dynamicReadaheadConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'dynamicReadaheadConfig': dynamicReadaheadConfig?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MediaCommonConfig].
  factory MediaCommonConfig.fromJson(String data) {
    return MediaCommonConfig.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MediaCommonConfig] to a JSON string.
  String toJson() => json.encode(toMap());
}
