import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/mappers/channerl_renderer_mapper.dart';
import 'package:innertube_dart/mappers/playlist_renderer_mapper.dart';
import 'package:innertube_dart/mappers/video_renderer_mapper.dart';
import 'package:innertube_dart/models/responses/channel.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/search_response.dart';
import 'package:innertube_dart/models/responses/video.dart';
import 'package:innertube_dart/utils/utils.dart';

class SearchResponseMapper
    extends BaseMapper<SearchResponse, Map<String, dynamic>> {
  final VideoRendererMapper _videoRendererMapper = VideoRendererMapper();
  final ChannelRendererMapper _channelRendererMapper = ChannelRendererMapper();
  final PlaylistRendererMapper _playlistRendererMapper =
      PlaylistRendererMapper();

  @override
  Map<String, dynamic> toData(SearchResponse model) {
    throw UnimplementedError();
  }

  @override
  SearchResponse toModel(Map<String, dynamic> data) {
    final videos = <Video>[];
    final channels = <Channel>[];
    final playlists = <Playlist>[];

    final List<dynamic> itemSectionRenderer = Utils.filterContents(
        data['contents']['twoColumnSearchResultsRenderer']['primaryContents']
            ['sectionListRenderer']['contents']);

    final Map<String, dynamic> continuationItemRenderer = (data['contents']
                ['twoColumnSearchResultsRenderer']['primaryContents']
            ['sectionListRenderer']['contents'] as List<dynamic>)
        .last['continuationItemRenderer'];

    for (final content in itemSectionRenderer) {
      if (content.containsKey('videoRenderer')) {
        videos.add(_videoRendererMapper
            .toModel(content['videoRenderer'] as Map<String, dynamic>));
      } else if (content.containsKey('channelRenderer')) {
        channels.add(_channelRendererMapper
            .toModel(content['channelRenderer'] as Map<String, dynamic>));
      } else if (content.containsKey('playlistRenderer')) {
        playlists.add(_playlistRendererMapper
            .toModel(content['playlistRenderer'] as Map<String, dynamic>));
      }
    }

    return SearchResponse(
      videos: videos,
      channels: channels,
      playlists: playlists,
      continuationToken: continuationItemRenderer['continuationEndpoint']
          ['continuationCommand']['token'],
    );
  }
}
