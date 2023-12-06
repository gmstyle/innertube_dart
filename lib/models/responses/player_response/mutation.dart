import 'dart:convert';

import 'payload.dart';

class Mutation {
  String? entityKey;
  String? type;
  Payload? payload;

  Mutation({this.entityKey, this.type, this.payload});

  factory Mutation.fromMap(Map<String, dynamic> data) => Mutation(
        entityKey: data['entityKey'] as String?,
        type: data['type'] as String?,
        payload: data['payload'] == null
            ? null
            : Payload.fromMap(data['payload'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'entityKey': entityKey,
        'type': type,
        'payload': payload?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Mutation].
  factory Mutation.fromJson(String data) {
    return Mutation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Mutation] to a JSON string.
  String toJson() => json.encode(toMap());
}
