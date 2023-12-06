import 'dart:convert';

class ActiveViewTracking {
  String? trafficType;

  ActiveViewTracking({this.trafficType});

  factory ActiveViewTracking.fromMap(Map<String, dynamic> data) {
    return ActiveViewTracking(
      trafficType: data['trafficType'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'trafficType': trafficType,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ActiveViewTracking].
  factory ActiveViewTracking.fromJson(String data) {
    return ActiveViewTracking.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ActiveViewTracking] to a JSON string.
  String toJson() => json.encode(toMap());
}
