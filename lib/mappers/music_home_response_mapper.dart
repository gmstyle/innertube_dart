import 'package:innertube_dart/mappers/base_mapper.dart';
import 'package:innertube_dart/models/responses/section.dart';
import 'package:innertube_dart/models/responses/music_home_response.dart';

class MusicHomeResponseMapper
    extends BaseMapper<MusicHomeResponse, Map<String, dynamic>> {
  @override
  Map<String, dynamic> toData(MusicHomeResponse model) {
    throw UnimplementedError();
  }

  @override
  MusicHomeResponse toModel(Map<String, dynamic> data) {
    final metadata = data['metadata'];
    return MusicHomeResponse(
      title: metadata['title'],
      description: metadata['description'],
      carouselVideos: data['carouselVideos'],
      sections: (data['sections'] as List<dynamic>)
          .map((e) => Section.fromJson(e))
          .toList(),
    );
  }
}
