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
    final playlistData = data['playlistData'];

    if (playlistData['title'] != null) {
      final id = playlistData['playlistId'] != null
          ? Utils.setPlaylistId(playlistData['playlistId'])
          : null;

      return Playlist(
          playlistId: id,
          title: playlistData['title'] != null
              ? playlistData['title']['simpleText']
              : null,
          description: playlistData['descriptionText'] != null
              ? playlistData['descriptionText']['simpleText']
              : null,
          thumbnails: playlistData['playlistHeaderBanner'] != null
              ? (playlistData['playlistHeaderBanner']
                          ['heroPlaylistThumbnailRenderer']['thumbnail']
                      ['thumbnails'] as List<dynamic>)
                  .map<Thumbnail>((e) => Thumbnail.fromJson(e))
                  .toList()
              : null,
          author: playlistData['ownerText'] != null
              ? playlistData['ownerText']['runs'][0]['text']
              : null,
          videoCount: playlistData['numVideosText'] != null
              ? playlistData['numVideosText']['runs'][0]['text']
              : null,
          videos: data['videos']);
    } else {
      // playlistData['pageTitle']

      var viewModel = playlistData['content']['pageHeaderViewModel'];
      final id = viewModel['actions']['flexibleActionsViewModel']['actionsRows']
                      [0]['actions'][0]['buttonViewModel']['onTap']
                  ['innertubeCommand']['watchEndpoint']['playlistId'] !=
              null
          ? Utils.setPlaylistId(playlistData['content']['pageHeaderViewModel']
                      ['actions']['flexibleActionsViewModel']['actionsRows'][0]
                  ['actions'][0]['buttonViewModel']['onTap']['innertubeCommand']
              ['watchEndpoint']['playlistId'])
          : null;

      final playlist = Playlist(
        playlistId: id,
        title: playlistData['pageTitle'],
        description: null,
        thumbnails: viewModel['heroImage']['contentPreviewImageViewModel']
                    ['image']['sources'] !=
                null
            ? (viewModel['heroImage']['contentPreviewImageViewModel']['image']
                    ['sources'] as List<dynamic>)
                .map<Thumbnail>((e) => Thumbnail.fromJson(e))
                .toList()
            : null,
        author: null,
        videoCount: viewModel['metadata']['contentMetadataViewModel']
                ['metadataRows'][1]['metadataParts'][1]['text']['content'] ??
            data['videos'].length.toString(),
        videos: data['videos'],
      );

      return playlist;
    }
  }
}
