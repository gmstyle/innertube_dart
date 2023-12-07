import 'package:innertube_dart/models/responses/video.dart';

class TrendingResponse {
  List<Video>? videos;

  TrendingResponse({this.videos});

  factory TrendingResponse.fromJson(Map<String, dynamic> json) {
    return TrendingResponse(
      videos: json['now'] != null
          ? (json['now'] as List).map((i) => Video.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (videos != null) {
      data['now'] = videos!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
