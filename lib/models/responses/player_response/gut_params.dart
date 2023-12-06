import 'dart:convert';

class GutParams {
  String? tag;

  GutParams({this.tag});

  factory GutParams.fromMap(Map<String, dynamic> data) => GutParams(
        tag: data['tag'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'tag': tag,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GutParams].
  factory GutParams.fromJson(String data) {
    return GutParams.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GutParams] to a JSON string.
  String toJson() => json.encode(toMap());
}
