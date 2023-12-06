import 'dart:convert';

import 'instream_ad_player_overlay_renderer.dart';

class PlayerOverlay {
  InstreamAdPlayerOverlayRenderer? instreamAdPlayerOverlayRenderer;

  PlayerOverlay({this.instreamAdPlayerOverlayRenderer});

  factory PlayerOverlay.fromMap(Map<String, dynamic> data) => PlayerOverlay(
        instreamAdPlayerOverlayRenderer:
            data['instreamAdPlayerOverlayRenderer'] == null
                ? null
                : InstreamAdPlayerOverlayRenderer.fromMap(
                    data['instreamAdPlayerOverlayRenderer']
                        as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'instreamAdPlayerOverlayRenderer':
            instreamAdPlayerOverlayRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerOverlay].
  factory PlayerOverlay.fromJson(String data) {
    return PlayerOverlay.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerOverlay] to a JSON string.
  String toJson() => json.encode(toMap());
}
