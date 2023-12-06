import 'dart:convert';

class Video {
  String? videoId;
  String? title;
  String? lengthSeconds;
  List<dynamic>? keywords;
  String? channelId;
  List<dynamic>? thumbnails;
  String? viewCount;
  String? author;
  Map<String, dynamic>? streamingData;

  Video({
    this.videoId,
    this.title,
    this.lengthSeconds,
    this.keywords,
    this.channelId,
    this.thumbnails,
    this.viewCount,
    this.author,
    this.streamingData,
  });

  factory Video.fromMap(Map<String, dynamic> data) => Video(
        videoId: data['videoId'] as String?,
        title: data['title'] as String?,
        lengthSeconds: data['lengthSeconds'] as String?,
        keywords: data['keywords'] as List<dynamic>?,
        channelId: data['channelId'] as String?,
        thumbnails: (data['thumbnails'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        viewCount: data['viewCount'] as String?,
        author: data['author'] as String?,
        streamingData: data['streamingData'] as Map<String, dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'videoId': videoId,
        'title': title,
        'lengthSeconds': lengthSeconds,
        'keywords': keywords,
        'channelId': channelId,
        'thumbnails':
            thumbnails?.map((e) => e as Map<String, dynamic>).toList(),
        'viewCount': viewCount,
        'author': author,
        'streamingData': streamingData,
      };

  /// `dart:convert`
  /// Parses the string and returns the resulting Json object as [Video].
  factory Video.fromJson(String data) {
    return Video.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  /// Converts [Video] to a JSON string.
  String toJson() => json.encode(toMap());
}
