import 'dart:convert';

class InfoCardIconRenderer {
  String? trackingParams;

  InfoCardIconRenderer({this.trackingParams});

  factory InfoCardIconRenderer.fromMap(Map<String, dynamic> data) {
    return InfoCardIconRenderer(
      trackingParams: data['trackingParams'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'trackingParams': trackingParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InfoCardIconRenderer].
  factory InfoCardIconRenderer.fromJson(String data) {
    return InfoCardIconRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InfoCardIconRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
