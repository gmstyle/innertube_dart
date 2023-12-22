import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/thumbnail.dart';
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
        playlistId: data['playlistData']['playlistId'] != null
            ? Utils.setPlaylistId(data['playlistData']['playlistId'])
            : null,
        title: data['playlistData']['title'] != null
            ? data['playlistData']['title']['simpleText']
            : null,
        description: data['playlistData']['descriptionText'] != null
            ? data['playlistData']['descriptionText']['simpleText']
            : null,
        thumbnails: data['playlistData']['playlistHeaderBanner'] != null
            ? (data['playlistData']['playlistHeaderBanner']
                        ['heroPlaylistThumbnailRenderer']['thumbnail']
                    ['thumbnails'] as List<dynamic>)
                .map<Thumbnail>((e) => Thumbnail.fromJson(e))
                .toList()
            : null,
        author: data['playlistData']['ownerText'] != null
            ? data['playlistData']['ownerText']['runs'][0]['text']
            : null,
        videoCount: data['playlistData']['numVideosText'] != null
            ? data['playlistData']['numVideosText']['runs'][0]['text']
            : null,
        videos: data['videos']);
  }
}
