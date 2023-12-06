import 'dart:convert';

import 'player_storyboard_spec_renderer.dart';

class Storyboards {
  PlayerStoryboardSpecRenderer? playerStoryboardSpecRenderer;

  Storyboards({this.playerStoryboardSpecRenderer});

  factory Storyboards.fromMap(Map<String, dynamic> data) => Storyboards(
        playerStoryboardSpecRenderer: data['playerStoryboardSpecRenderer'] ==
                null
            ? null
            : PlayerStoryboardSpecRenderer.fromMap(
                data['playerStoryboardSpecRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'playerStoryboardSpecRenderer': playerStoryboardSpecRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Storyboards].
  factory Storyboards.fromJson(String data) {
    return Storyboards.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Storyboards] to a JSON string.
  String toJson() => json.encode(toMap());
}
