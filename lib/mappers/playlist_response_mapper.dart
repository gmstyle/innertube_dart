import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/utils/utils.dart';

class PlaylistResponseMapper
    extends BaseMapper<Playlist, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(Playlist model) {
    throw UnimplementedError();
  }

  @override
  Playlist toModel(Map<String, dynamic> data) {
    return Playlist(
        playlistId: Utils.setPlaylistId(data['playlistData']['playlistId']),
        title: data['playlistData']['title']['simpleText'],
        description: data['playlistData']['descriptionText']['simpleText'],
        thumbnails: data['playlistData']['playlistHeaderBanner']
            ['heroPlaylistThumbnailRenderer']['thumbnail']['thumbnails'],
        author: data['playlistData']['ownerText']['runs'][0]['text'],
        videoCount: data['playlistData']['numVideosText']['runs'][0]['text'],
        videos: data['videos']);
  }
}
