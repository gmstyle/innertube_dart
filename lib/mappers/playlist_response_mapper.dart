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
        title: playlistData['title']?['simpleText'],
        description: playlistData['descriptionText']?['simpleText'],
        thumbnails: _extractThumbnails(playlistData['playlistHeaderBanner']),
        author: playlistData['ownerText']?['runs']?[0]?['text'],
        videoCount: playlistData['numVideosText']?['runs']?[0]?['text'],
        videos: data['videos'],
      );
    } else {
      final viewModel = playlistData['content']['pageHeaderViewModel'];
      final id = viewModel['actions']['flexibleActionsViewModel']['actionsRows']
                      [0]['actions'][0]['buttonViewModel']['onTap']
                  ['innertubeCommand']['watchEndpoint']['playlistId'] !=
              null
          ? Utils.setPlaylistId(viewModel['actions']['flexibleActionsViewModel']
                  ['actionsRows'][0]['actions'][0]['buttonViewModel']['onTap']
              ['innertubeCommand']['watchEndpoint']['playlistId'])
          : null;

      return Playlist(
        playlistId: id,
        title: playlistData['pageTitle'],
        description: null,
        thumbnails: _extractThumbnails(
            viewModel['heroImage']['contentPreviewImageViewModel']['image']),
        author: null,
        videoCount: _extractVideoCount(viewModel, data['videos']),
        videos: data['videos'],
      );
    }
  }

  List<Thumbnail>? _extractThumbnails(dynamic thumbnailData) {
    if (thumbnailData == null) return null;
    final thumbnails = thumbnailData['heroPlaylistThumbnailRenderer']
            ?['thumbnail']?['thumbnails'] ??
        thumbnailData['sources'];
    return thumbnails != null
        ? (thumbnails as List<dynamic>)
            .map<Thumbnail>((e) => Thumbnail.fromJson(e))
            .toList()
        : null;
  }

  String? _extractVideoCount(dynamic viewModel, List<dynamic> videos) {
    final metadataParts = viewModel['metadata']['contentMetadataViewModel']
        ['metadataRows'][1]['metadataParts'] as List<dynamic>?;
    if (metadataParts == null) return '${videos.length} videos';
    return metadataParts.length == 1
        ? metadataParts[0]['text']['content']
        : metadataParts[1]['text']['content'] ?? videos.length.toString();
  }
}
