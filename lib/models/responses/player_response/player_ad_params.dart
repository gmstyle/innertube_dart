import 'dart:convert';

class PlayerAdParams {
  bool? showContentThumbnail;
  String? enabledEngageTypes;

  PlayerAdParams({this.showContentThumbnail, this.enabledEngageTypes});

  factory PlayerAdParams.fromMap(Map<String, dynamic> data) {
    return PlayerAdParams(
      showContentThumbnail: data['showContentThumbnail'] as bool?,
      enabledEngageTypes: data['enabledEngageTypes'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'showContentThumbnail': showContentThumbnail,
        'enabledEngageTypes': enabledEngageTypes,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerAdParams].
  factory PlayerAdParams.fromJson(String data) {
    return PlayerAdParams.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerAdParams] to a JSON string.
  String toJson() => json.encode(toMap());
}
