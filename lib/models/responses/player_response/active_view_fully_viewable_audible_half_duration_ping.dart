import 'dart:convert';

class ActiveViewFullyViewableAudibleHalfDurationPing {
  String? baseUrl;

  ActiveViewFullyViewableAudibleHalfDurationPing({this.baseUrl});

  factory ActiveViewFullyViewableAudibleHalfDurationPing.fromMap(
      Map<String, dynamic> data) {
    return ActiveViewFullyViewableAudibleHalfDurationPing(
      baseUrl: data['baseUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ActiveViewFullyViewableAudibleHalfDurationPing].
  factory ActiveViewFullyViewableAudibleHalfDurationPing.fromJson(String data) {
    return ActiveViewFullyViewableAudibleHalfDurationPing.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ActiveViewFullyViewableAudibleHalfDurationPing] to a JSON string.
  String toJson() => json.encode(toMap());
}
