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
      playlistId: data['playlistId'],
      title: data['title']['simpleText'],
      thumbnails: (data['thumbnails'][0]['thumbnails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      videoCount: data['videoCount'],
    );
  }
}
