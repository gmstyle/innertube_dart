import 'dart:convert';

class OfflineabilityEntity {
  String? key;
  String? addToOfflineButtonState;

  OfflineabilityEntity({this.key, this.addToOfflineButtonState});

  factory OfflineabilityEntity.fromMap(Map<String, dynamic> data) {
    return OfflineabilityEntity(
      key: data['key'] as String?,
      addToOfflineButtonState: data['addToOfflineButtonState'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'key': key,
        'addToOfflineButtonState': addToOfflineButtonState,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OfflineabilityEntity].
  factory OfflineabilityEntity.fromJson(String data) {
    return OfflineabilityEntity.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OfflineabilityEntity] to a JSON string.
  String toJson() => json.encode(toMap());
}
