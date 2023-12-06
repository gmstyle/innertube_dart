import 'dart:convert';

import 'accessibility_data.dart';

class SubscribeAccessibility {
  AccessibilityData? accessibilityData;

  SubscribeAccessibility({this.accessibilityData});

  factory SubscribeAccessibility.fromMap(Map<String, dynamic> data) {
    return SubscribeAccessibility(
      accessibilityData: data['accessibilityData'] == null
          ? null
          : AccessibilityData.fromMap(
              data['accessibilityData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'accessibilityData': accessibilityData?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubscribeAccessibility].
  factory SubscribeAccessibility.fromJson(String data) {
    return SubscribeAccessibility.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubscribeAccessibility] to a JSON string.
  String toJson() => json.encode(toMap());
}
