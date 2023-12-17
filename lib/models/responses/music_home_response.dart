import 'package:innertube_dart/models/responses/section.dart';
import 'package:innertube_dart/models/responses/video.dart';

class MusicHomeResponse {
  final String? title;
  final String? description;
  final List<Video>? carouselVideos;
  final List<Section>? sections;

  MusicHomeResponse({
    this.title,
    this.description,
    this.carouselVideos,
    this.sections,
  });

  factory MusicHomeResponse.fromJson(Map<String, dynamic> json) {
    return MusicHomeResponse(
      title: json['title'],
      description: json['description'],
      carouselVideos: json['carouselItems'],
      sections: json['sections'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'carouselItems': carouselVideos,
      'sections': sections,
    };
  }
}
