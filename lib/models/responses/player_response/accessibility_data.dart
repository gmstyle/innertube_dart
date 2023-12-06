import 'dart:convert';

class AccessibilityData {
  String? label;

  AccessibilityData({this.label});

  factory AccessibilityData.fromMap(Map<String, dynamic> data) {
    return AccessibilityData(
      label: data['label'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'label': label,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AccessibilityData].
  factory AccessibilityData.fromJson(String data) {
    return AccessibilityData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AccessibilityData] to a JSON string.
  String toJson() => json.encode(toMap());
}
