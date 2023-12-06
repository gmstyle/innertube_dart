import 'dart:convert';

import 'ad_layout_logging_data.dart';

class AdLayoutMetadata {
  String? layoutId;
  String? layoutType;
  AdLayoutLoggingData? adLayoutLoggingData;

  AdLayoutMetadata({
    this.layoutId,
    this.layoutType,
    this.adLayoutLoggingData,
  });

  factory AdLayoutMetadata.fromMap(Map<String, dynamic> data) {
    return AdLayoutMetadata(
      layoutId: data['layoutId'] as String?,
      layoutType: data['layoutType'] as String?,
      adLayoutLoggingData: data['adLayoutLoggingData'] == null
          ? null
          : AdLayoutLoggingData.fromMap(
              data['adLayoutLoggingData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'layoutId': layoutId,
        'layoutType': layoutType,
        'adLayoutLoggingData': adLayoutLoggingData?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdLayoutMetadata].
  factory AdLayoutMetadata.fromJson(String data) {
    return AdLayoutMetadata.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AdLayoutMetadata] to a JSON string.
  String toJson() => json.encode(toMap());
}
