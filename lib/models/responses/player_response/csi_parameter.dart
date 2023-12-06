import 'dart:convert';

class CsiParameter {
  String? key;
  String? value;

  CsiParameter({this.key, this.value});

  factory CsiParameter.fromMap(Map<String, dynamic> data) => CsiParameter(
        key: data['key'] as String?,
        value: data['value'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'key': key,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CsiParameter].
  factory CsiParameter.fromJson(String data) {
    return CsiParameter.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CsiParameter] to a JSON string.
  String toJson() => json.encode(toMap());
}
