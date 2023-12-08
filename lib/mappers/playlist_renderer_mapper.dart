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
    return Playlist(
      playlistId: Utils.setPlaylistId(data['playlistId']),
      title: data['title']['simpleText'],
      thumbnails: (data['thumbnails'][0]['thumbnails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      videoCount: data['videoCount'],
    );
  }
}
