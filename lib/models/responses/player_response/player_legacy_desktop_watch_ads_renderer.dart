import 'dart:convert';

import 'gut_params.dart';
import 'player_ad_params.dart';

class PlayerLegacyDesktopWatchAdsRenderer {
  PlayerAdParams? playerAdParams;
  GutParams? gutParams;
  bool? showCompanion;
  bool? showInstream;
  bool? useGut;

  PlayerLegacyDesktopWatchAdsRenderer({
    this.playerAdParams,
    this.gutParams,
    this.showCompanion,
    this.showInstream,
    this.useGut,
  });

  factory PlayerLegacyDesktopWatchAdsRenderer.fromMap(
      Map<String, dynamic> data) {
    return PlayerLegacyDesktopWatchAdsRenderer(
      playerAdParams: data['playerAdParams'] == null
          ? null
          : PlayerAdParams.fromMap(
              data['playerAdParams'] as Map<String, dynamic>),
      gutParams: data['gutParams'] == null
          ? null
          : GutParams.fromMap(data['gutParams'] as Map<String, dynamic>),
      showCompanion: data['showCompanion'] as bool?,
      showInstream: data['showInstream'] as bool?,
      useGut: data['useGut'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'playerAdParams': playerAdParams?.toMap(),
        'gutParams': gutParams?.toMap(),
        'showCompanion': showCompanion,
        'showInstream': showInstream,
        'useGut': useGut,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerLegacyDesktopWatchAdsRenderer].
  factory PlayerLegacyDesktopWatchAdsRenderer.fromJson(String data) {
    return PlayerLegacyDesktopWatchAdsRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerLegacyDesktopWatchAdsRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
