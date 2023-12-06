import 'dart:convert';

import 'entity_batch_update.dart';

class FrameworkUpdates {
  EntityBatchUpdate? entityBatchUpdate;

  FrameworkUpdates({this.entityBatchUpdate});

  factory FrameworkUpdates.fromMap(Map<String, dynamic> data) {
    return FrameworkUpdates(
      entityBatchUpdate: data['entityBatchUpdate'] == null
          ? null
          : EntityBatchUpdate.fromMap(
              data['entityBatchUpdate'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'entityBatchUpdate': entityBatchUpdate?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FrameworkUpdates].
  factory FrameworkUpdates.fromJson(String data) {
    return FrameworkUpdates.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FrameworkUpdates] to a JSON string.
  String toJson() => json.encode(toMap());
}
