import 'dart:convert';

import 'command_metadata.dart';
import 'playlist_edit_endpoint.dart';

class AddToWatchLaterCommand {
  String? clickTrackingParams;
  CommandMetadata? commandMetadata;
  PlaylistEditEndpoint? playlistEditEndpoint;

  AddToWatchLaterCommand({
    this.clickTrackingParams,
    this.commandMetadata,
    this.playlistEditEndpoint,
  });

  factory AddToWatchLaterCommand.fromMap(Map<String, dynamic> data) {
    return AddToWatchLaterCommand(
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
  /// Parses the string and returns the resulting Json object as [AddToWatchLaterCommand].
  factory AddToWatchLaterCommand.fromJson(String data) {
    return AddToWatchLaterCommand.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddToWatchLaterCommand] to a JSON string.
  String toJson() => json.encode(toMap());
}
