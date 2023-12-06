import 'dart:convert';

import 'player_captions_tracklist_renderer.dart';

class Captions {
  PlayerCaptionsTracklistRenderer? playerCaptionsTracklistRenderer;

  Captions({this.playerCaptionsTracklistRenderer});

  factory Captions.fromMap(Map<String, dynamic> data) => Captions(
        playerCaptionsTracklistRenderer:
            data['playerCaptionsTracklistRenderer'] == null
                ? null
                : PlayerCaptionsTracklistRenderer.fromMap(
                    data['playerCaptionsTracklistRenderer']
                        as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'playerCaptionsTracklistRenderer':
            playerCaptionsTracklistRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Captions].
  factory Captions.fromJson(String data) {
    return Captions.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Captions] to a JSON string.
  String toJson() => json.encode(toMap());
}
