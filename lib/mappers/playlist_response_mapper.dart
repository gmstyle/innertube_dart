import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/mappers/video_mapper_response.dart';
import 'package:innertube_dart/models/responses/playlist_response.dart';

class PlaylistResponseMapper
    extends BaseMapper<PlaylistResponse, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(PlaylistResponse model) {
    throw UnimplementedError();
  }

  @override
  PlaylistResponse toModel(Map<String, dynamic> data) {
    return PlaylistResponse();
  }
}
