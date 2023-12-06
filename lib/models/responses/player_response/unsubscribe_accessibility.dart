import 'dart:convert';

import 'accessibility_data.dart';

class UnsubscribeAccessibility {
  AccessibilityData? accessibilityData;

  UnsubscribeAccessibility({this.accessibilityData});

  factory UnsubscribeAccessibility.fromMap(Map<String, dynamic> data) {
    return UnsubscribeAccessibility(
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
  /// Parses the string and returns the resulting Json object as [UnsubscribeAccessibility].
  factory UnsubscribeAccessibility.fromJson(String data) {
    return UnsubscribeAccessibility.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UnsubscribeAccessibility] to a JSON string.
  String toJson() => json.encode(toMap());
}
