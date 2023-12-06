import 'dart:convert';

import 'player_attestation_renderer.dart';

class Attestation {
  PlayerAttestationRenderer? playerAttestationRenderer;

  Attestation({this.playerAttestationRenderer});

  factory Attestation.fromMap(Map<String, dynamic> data) => Attestation(
        playerAttestationRenderer: data['playerAttestationRenderer'] == null
            ? null
            : PlayerAttestationRenderer.fromMap(
                data['playerAttestationRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'playerAttestationRenderer': playerAttestationRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Attestation].
  factory Attestation.fromJson(String data) {
    return Attestation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Attestation] to a JSON string.
  String toJson() => json.encode(toMap());
}
