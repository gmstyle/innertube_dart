import 'dart:convert';

import 'player_legacy_desktop_watch_ads_renderer.dart';

class PlayerAd {
  PlayerLegacyDesktopWatchAdsRenderer? playerLegacyDesktopWatchAdsRenderer;

  PlayerAd({this.playerLegacyDesktopWatchAdsRenderer});

  factory PlayerAd.fromMap(Map<String, dynamic> data) => PlayerAd(
        playerLegacyDesktopWatchAdsRenderer:
            data['playerLegacyDesktopWatchAdsRenderer'] == null
                ? null
                : PlayerLegacyDesktopWatchAdsRenderer.fromMap(
                    data['playerLegacyDesktopWatchAdsRenderer']
                        as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'playerLegacyDesktopWatchAdsRenderer':
            playerLegacyDesktopWatchAdsRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerAd].
  factory PlayerAd.fromJson(String data) {
    return PlayerAd.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerAd] to a JSON string.
  String toJson() => json.encode(toMap());
}
