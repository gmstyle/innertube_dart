import 'dart:convert';

class ActiveViewMeasurablePing {
  String? baseUrl;

  ActiveViewMeasurablePing({this.baseUrl});

  factory ActiveViewMeasurablePing.fromMap(Map<String, dynamic> data) {
    return ActiveViewMeasurablePing(
      baseUrl: data['baseUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ActiveViewMeasurablePing].
  factory ActiveViewMeasurablePing.fromJson(String data) {
    return ActiveViewMeasurablePing.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ActiveViewMeasurablePing] to a JSON string.
  String toJson() => json.encode(toMap());
}
