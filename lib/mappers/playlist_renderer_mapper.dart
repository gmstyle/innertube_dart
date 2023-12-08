import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/playlist.dart';

class PlaylistRendererMapper
    extends BaseMapper<Playlist, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(Playlist model) {
    throw UnimplementedError();
  }

  @override
  Playlist toModel(Map<String, dynamic> data) {
    return Playlist(
      playlistId: setPlaylistId(data['playlistId']),
      title: data['title']['simpleText'],
      thumbnails: (data['thumbnails'][0]['thumbnails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      videoCount: data['videoCount'],
    );
  }

  /// Sets the playlist ID based on the provided ID.
  ///
  /// To retrieve a given playlist, first, identify the playlist's ID.
  /// In a URL this will be the code after ?list=. For example:
  /// https://www.youtube.com/playlist?list=PLB7ZcpBcwdC7rGYl6StHarkLlgeZX66oL's ID will be PLB7ZcpBcwdC7rGYl6StHarkLlgeZX66oL.
  /// Playlist IDs will always begin with the string VLPL (case sensitive).
  /// For IDs retrieved from URLs, this will mean that you need to prepend VL to the ID.
  ///
  /// If the ID starts with 'PL', the prefix is replaced with 'VL'.
  /// If the ID starts with 'VL', the ID remains unchanged.
  ///
  /// Returns the modified playlist ID, or null if the provided ID is null.
  String? setPlaylistId(String? id) {
    String? playlistId;

    if (id != null) {
      if (id.startsWith('PL')) {
        playlistId = 'VL$id';
      } else if (id.startsWith('VL')) {
        playlistId = id;
      }
    }

    return playlistId;
  }
}
