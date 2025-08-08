import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/playlist.dart';
import 'package:innertube_dart/models/responses/thumbnail.dart';

class LockupViewModelMapper extends BaseMapper<Playlist, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(Playlist model) {
    throw UnimplementedError();
  }

  @override
  Playlist toModel(Map<String, dynamic> data) {
    // Verifica che sia una playlist
    if (data['contentType'] != 'LOCKUP_CONTENT_TYPE_PLAYLIST') {
      throw ArgumentError('LockupViewModel is not a playlist');
    }

    // Estrazione dei dati dalla struttura lockupViewModel
    final contentId = data['contentId'] as String?;
    final metadata = data['metadata']?['lockupMetadataViewModel'];
    final title = metadata?['title']?['content'] as String?;

    // Estrazione dell'autore dalla prima metadata row
    String? author;
    final metadataRows = metadata?['metadata']?['contentMetadataViewModel']
        ?['metadataRows'] as List?;
    if (metadataRows != null && metadataRows.isNotEmpty) {
      final firstRow = metadataRows[0];
      final metadataParts = firstRow['metadataParts'] as List?;
      if (metadataParts != null && metadataParts.isNotEmpty) {
        author = metadataParts[0]['text']?['content'] as String?;
      }
    }

    // Estrazione del conteggio video dal badge
    String? videoCountText;
    final overlays = data['contentImage']?['collectionThumbnailViewModel']
        ?['primaryThumbnail']?['thumbnailViewModel']?['overlays'] as List?;
    if (overlays != null) {
      for (final overlay in overlays) {
        final badgeViewModel = overlay['thumbnailOverlayBadgeViewModel'];
        if (badgeViewModel != null) {
          final badges = badgeViewModel['thumbnailBadges'] as List?;
          if (badges != null && badges.isNotEmpty) {
            final badge = badges[0]['thumbnailBadgeViewModel'];
            if (badge != null &&
                badge['icon']?['sources']?[0]?['clientResource']
                        ?['imageName'] ==
                    'PLAYLISTS') {
              videoCountText = badge['text'] as String?;
              break;
            }
          }
        }
      }
    }

    // Estrazione della thumbnail
    List<Thumbnail> thumbnails = [];
    final thumbnailSources = data['contentImage']
            ?['collectionThumbnailViewModel']?['primaryThumbnail']
        ?['thumbnailViewModel']?['image']?['sources'] as List?;
    if (thumbnailSources != null) {
      thumbnails = thumbnailSources.map<Thumbnail>((source) {
        return Thumbnail(
          url: source['url'] as String,
          width: source['width'] as int? ?? 0,
          height: source['height'] as int? ?? 0,
        );
      }).toList();
    }

    // Estrazione del playlist ID dal contentId o dal watchEndpoint
    String? playlistId = contentId;
    final watchEndpoint = data['rendererContext']?['commandContext']?['onTap']
        ?['innertubeCommand']?['watchEndpoint'];
    if (watchEndpoint != null && watchEndpoint['playlistId'] != null) {
      playlistId = watchEndpoint['playlistId'] as String;
    }

    return Playlist(
      playlistId: playlistId ?? '',
      title: title ?? '',
      author: author ?? '',
      videoCount: videoCountText ?? '',
      thumbnails: thumbnails,
    );
  }
}
