import 'dart:convert';

import 'botguard_data.dart';

class PlayerAttestationRenderer {
  String? challenge;
  BotguardData? botguardData;

  PlayerAttestationRenderer({this.challenge, this.botguardData});

  factory PlayerAttestationRenderer.fromMap(Map<String, dynamic> data) {
    return PlayerAttestationRenderer(
      challenge: data['challenge'] as String?,
      botguardData: data['botguardData'] == null
          ? null
          : BotguardData.fromMap(data['botguardData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'challenge': challenge,
        'botguardData': botguardData?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerAttestationRenderer].
  factory PlayerAttestationRenderer.fromJson(String data) {
    return PlayerAttestationRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerAttestationRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
