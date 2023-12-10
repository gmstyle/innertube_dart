import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/music_home_response.dart';

class MusicHomeResponseMapper
    extends BaseMapper<MusicHomeResponse, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(MusicHomeResponse model) {
    throw UnimplementedError();
  }

  @override
  MusicHomeResponse toModel(Map<String, dynamic> data) {
    return MusicHomeResponse();
  }
}
