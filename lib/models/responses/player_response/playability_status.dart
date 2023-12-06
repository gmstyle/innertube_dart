import 'dart:convert';

import 'miniplayer.dart';

class PlayabilityStatus {
  String? status;
  bool? playableInEmbed;
  Miniplayer? miniplayer;
  String? contextParams;

  PlayabilityStatus({
    this.status,
    this.playableInEmbed,
    this.miniplayer,
    this.contextParams,
  });

  factory PlayabilityStatus.fromMap(Map<String, dynamic> data) {
    return PlayabilityStatus(
      status: data['status'] as String?,
      playableInEmbed: data['playableInEmbed'] as bool?,
      miniplayer: data['miniplayer'] == null
          ? null
          : Miniplayer.fromMap(data['miniplayer'] as Map<String, dynamic>),
      contextParams: data['contextParams'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'playableInEmbed': playableInEmbed,
        'miniplayer': miniplayer?.toMap(),
        'contextParams': contextParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayabilityStatus].
  factory PlayabilityStatus.fromJson(String data) {
    return PlayabilityStatus.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayabilityStatus] to a JSON string.
  String toJson() => json.encode(toMap());
}
