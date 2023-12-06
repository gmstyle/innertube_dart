import 'dart:convert';

import 'command_metadata.dart';
import 'playlist_edit_endpoint.dart';

class RemoveFromWatchLaterCommand {
  String? clickTrackingParams;
  CommandMetadata? commandMetadata;
  PlaylistEditEndpoint? playlistEditEndpoint;

  RemoveFromWatchLaterCommand({
    this.clickTrackingParams,
    this.commandMetadata,
    this.playlistEditEndpoint,
  });

  factory RemoveFromWatchLaterCommand.fromMap(Map<String, dynamic> data) {
    return RemoveFromWatchLaterCommand(
      clickTrackingParams: data['clickTrackingParams'] as String?,
      commandMetadata: data['commandMetadata'] == null
          ? null
          : CommandMetadata.fromMap(
              data['commandMetadata'] as Map<String, dynamic>),
      playlistEditEndpoint: data['playlistEditEndpoint'] == null
          ? null
          : PlaylistEditEndpoint.fromMap(
              data['playlistEditEndpoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'clickTrackingParams': clickTrackingParams,
        'commandMetadata': commandMetadata?.toMap(),
        'playlistEditEndpoint': playlistEditEndpoint?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RemoveFromWatchLaterCommand].
  factory RemoveFromWatchLaterCommand.fromJson(String data) {
    return RemoveFromWatchLaterCommand.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RemoveFromWatchLaterCommand] to a JSON string.
  String toJson() => json.encode(toMap());
}
