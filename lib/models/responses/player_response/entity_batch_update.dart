import 'dart:convert';

import 'mutation.dart';
import 'timestamp.dart';

class EntityBatchUpdate {
  List<Mutation>? mutations;
  Timestamp? timestamp;

  EntityBatchUpdate({this.mutations, this.timestamp});

  factory EntityBatchUpdate.fromMap(Map<String, dynamic> data) {
    return EntityBatchUpdate(
      mutations: (data['mutations'] as List<dynamic>?)
          ?.map((e) => Mutation.fromMap(e as Map<String, dynamic>))
          .toList(),
      timestamp: data['timestamp'] == null
          ? null
          : Timestamp.fromMap(data['timestamp'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'mutations': mutations?.map((e) => e.toMap()).toList(),
        'timestamp': timestamp?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EntityBatchUpdate].
  factory EntityBatchUpdate.fromJson(String data) {
    return EntityBatchUpdate.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EntityBatchUpdate] to a JSON string.
  String toJson() => json.encode(toMap());
}
