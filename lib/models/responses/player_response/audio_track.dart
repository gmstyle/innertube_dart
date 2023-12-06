import 'dart:convert';

class AudioTrack {
  List<dynamic>? captionTrackIndices;

  AudioTrack({this.captionTrackIndices});

  factory AudioTrack.fromMap(Map<String, dynamic> data) => AudioTrack(
        captionTrackIndices: data['captionTrackIndices'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'captionTrackIndices': captionTrackIndices,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AudioTrack].
  factory AudioTrack.fromJson(String data) {
    return AudioTrack.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AudioTrack] to a JSON string.
  String toJson() => json.encode(toMap());
}
