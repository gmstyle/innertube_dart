import 'dart:convert';

class MiniplayerRenderer {
  String? playbackMode;

  MiniplayerRenderer({this.playbackMode});

  factory MiniplayerRenderer.fromMap(Map<String, dynamic> data) {
    return MiniplayerRenderer(
      playbackMode: data['playbackMode'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'playbackMode': playbackMode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MiniplayerRenderer].
  factory MiniplayerRenderer.fromJson(String data) {
    return MiniplayerRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MiniplayerRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
