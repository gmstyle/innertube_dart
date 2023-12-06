import 'dart:convert';

import 'action.dart';

class PlaylistEditEndpoint {
  String? playlistId;
  List<Action>? actions;

  PlaylistEditEndpoint({this.playlistId, this.actions});

  factory PlaylistEditEndpoint.fromMap(Map<String, dynamic> data) {
    return PlaylistEditEndpoint(
      playlistId: data['playlistId'] as String?,
      actions: (data['actions'] as List<dynamic>?)
          ?.map((e) => Action.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'playlistId': playlistId,
        'actions': actions?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlaylistEditEndpoint].
  factory PlaylistEditEndpoint.fromJson(String data) {
    return PlaylistEditEndpoint.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlaylistEditEndpoint] to a JSON string.
  String toJson() => json.encode(toMap());
}
