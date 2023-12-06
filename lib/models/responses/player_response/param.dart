import 'dart:convert';

class Param {
  final String? key;
  final String? value;

  Param({this.key, this.value});

  factory Param.fromMap(Map<String, dynamic> data) => Param(
        key: data['key'] as String?,
        value: data['value'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'key': key,
        'value': value,
      };

  /// `dart:convert`
  /// Parses the string and returns the resulting Json object as [Param].
  factory Param.fromJson(String data) {
    return Param.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Param] to a JSON string.
  String toJson() => json.encode(toMap());
}
