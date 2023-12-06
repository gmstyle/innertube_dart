import 'dart:convert';

class PlayerStoryboardSpecRenderer {
  String? spec;
  int? recommendedLevel;
  int? highResolutionRecommendedLevel;

  PlayerStoryboardSpecRenderer({
    this.spec,
    this.recommendedLevel,
    this.highResolutionRecommendedLevel,
  });

  factory PlayerStoryboardSpecRenderer.fromMap(Map<String, dynamic> data) {
    return PlayerStoryboardSpecRenderer(
      spec: data['spec'] as String?,
      recommendedLevel: data['recommendedLevel'] as int?,
      highResolutionRecommendedLevel:
          data['highResolutionRecommendedLevel'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'spec': spec,
        'recommendedLevel': recommendedLevel,
        'highResolutionRecommendedLevel': highResolutionRecommendedLevel,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerStoryboardSpecRenderer].
  factory PlayerStoryboardSpecRenderer.fromJson(String data) {
    return PlayerStoryboardSpecRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerStoryboardSpecRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
