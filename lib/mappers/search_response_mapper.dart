import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/search_response/search_response.dart';
import 'package:innertube_dart/models/responses/video/video.dart';

class SearchResponseMapper
    extends BaseMapper<SearchResponse, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(SearchResponse model) {
    throw UnimplementedError();
  }

  @override
  SearchResponse toModel(Map<String, dynamic> data) {
    final videos = <Video>[];
    final channels = <Channel>[];
    final playlists = <Playlist>[];

    final List<dynamic> itemSectionRenderer = data['contents']
                ['twoColumnSearchResultsRenderer']['primaryContents']
            ['sectionListRenderer']['contents'][0]['itemSectionRenderer']
        ['contents'];
    final Map<String, dynamic> continuationItemRenderer = data['contents']
            ['twoColumnSearchResultsRenderer']['primaryContents']
        ['sectionListRenderer']['contents'][1]['continuationItemRenderer'];

    for (final content in itemSectionRenderer) {
      if (content.containsKey('videoRenderer')) {
        videos.add(_toVideo(content['videoRenderer'] as Map<String, dynamic>));
      } else if (content.containsKey('channelRenderer')) {
        channels.add(
            _toChannel(content['channelRenderer'] as Map<String, dynamic>));
      } else if (content.containsKey('playlistRenderer')) {
        playlists.add(
            _toPlaylist(content['playlistRenderer'] as Map<String, dynamic>));
      }
    }

    return SearchResponse(
      videos: videos,
      channels: channels,
      playlists: playlists,
      continuationToken: continuationItemRenderer.isNotEmpty
          ? continuationItemRenderer['continuationEndpoint']
              ['continuationCommand']['token']
          : null,
    );
  }

  // Map content to Video
  Video _toVideo(Map<String, dynamic> videoRenderer) {
    return Video(
      videoId: videoRenderer['videoId'],
      title: videoRenderer['title']['runs'][0]['text'],
      lengthSeconds: videoRenderer['lengthText']['simpleText'],
      channelId: videoRenderer['channelThumbnailSupportedRenderers']
              ['channelThumbnailWithLinkRenderer']['navigationEndpoint']
          ['browseEndpoint']['browseId'],
      thumbnails: (videoRenderer['thumbnail']['thumbnails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      viewCount: videoRenderer['viewCountText']['simpleText'],
    );
  }

  // Map content to Channel
  Channel _toChannel(Map<String, dynamic> channelRenderer) {
    return Channel(
      channelId: channelRenderer['channelId'],
      title: channelRenderer['title']['simpleText'],
      thumbnails: (channelRenderer['thumbnail']['thumbnails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      videoCount: channelRenderer['videoCountText']['simpleText'],
      subscriberCount: channelRenderer['subscriberCountText']['simpleText'],
    );
  }

  // Map content to Playlist
  Playlist _toPlaylist(Map<String, dynamic> playlistRenderer) {
    return Playlist(
      playlistId: playlistRenderer['playlistId'],
      title: playlistRenderer['title']['simpleText'],
      thumbnails:
          (playlistRenderer['thumbnails'][0]['thumbnails'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      videoCount: playlistRenderer['videoCount'],
    );
  }
}
