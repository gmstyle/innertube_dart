import 'dart:convert';

class Accessibility {
  String? label;

  Accessibility({this.label});

  factory Accessibility.fromMap(Map<String, dynamic> data) => Accessibility(
        label: data['label'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'label': label,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Accessibility].
  factory Accessibility.fromJson(String data) {
    return Accessibility.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Accessibility] to a JSON string.
  String toJson() => json.encode(toMap());
}
