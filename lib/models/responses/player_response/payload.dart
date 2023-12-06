import 'dart:convert';

import 'offlineability_entity.dart';

class Payload {
  OfflineabilityEntity? offlineabilityEntity;

  Payload({this.offlineabilityEntity});

  factory Payload.fromMap(Map<String, dynamic> data) => Payload(
        offlineabilityEntity: data['offlineabilityEntity'] == null
            ? null
            : OfflineabilityEntity.fromMap(
                data['offlineabilityEntity'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'offlineabilityEntity': offlineabilityEntity?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Payload].
  factory Payload.fromJson(String data) {
    return Payload.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Payload] to a JSON string.
  String toJson() => json.encode(toMap());
}
