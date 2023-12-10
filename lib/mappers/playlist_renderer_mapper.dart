import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/utils/utils.dart';

class PlaylistRendererMapper
    extends BaseMapper<Playlist, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(Playlist model) {
    throw UnimplementedError();
  }

  @override
  Playlist toModel(Map<String, dynamic> data) {
    if (data['gridPlaylistRenderer'] != null) {
      return Playlist(
        playlistId:
            Utils.setPlaylistId(data['gridPlaylistRenderer']['playlistId']),
        title: data['gridPlaylistRenderer']['title']['runs'][0]['text'],
        thumbnails: data['gridPlaylistRenderer']['thumbnail']['thumbnails'],
        videoCount: data['gridPlaylistRenderer']['videoCountText']['runs'][0]
            ['text'],
      );
    }

    // data['playlistRenderer]
    return Playlist(
      playlistId: Utils.setPlaylistId(data['playlistId']),
      title: data['title']['simpleText'],
      thumbnails: data['thumbnails'][0]['thumbnails'],
      videoCount: data['videoCount'],
    );
  }
}
