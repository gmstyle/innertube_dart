import 'dart:convert';

import 'thumbnail.dart';

class VideoDetails {
  String? videoId;
  String? title;
  String? lengthSeconds;
  List<dynamic>? keywords;
  String? channelId;
  bool? isOwnerViewing;
  String? shortDescription;
  bool? isCrawlable;
  Thumbnail? thumbnail;
  bool? allowRatings;
  String? viewCount;
  String? author;
  bool? isPrivate;
  bool? isUnpluggedCorpus;
  bool? isLiveContent;

  VideoDetails({
    this.videoId,
    this.title,
    this.lengthSeconds,
    this.keywords,
    this.channelId,
    this.isOwnerViewing,
    this.shortDescription,
    this.isCrawlable,
    this.thumbnail,
    this.allowRatings,
    this.viewCount,
    this.author,
    this.isPrivate,
    this.isUnpluggedCorpus,
    this.isLiveContent,
  });

  factory VideoDetails.fromMap(Map<String, dynamic> data) => VideoDetails(
        videoId: data['videoId'] as String?,
        title: data['title'] as String?,
        lengthSeconds: data['lengthSeconds'] as String?,
        keywords: data['keywords'] as List<dynamic>?,
        channelId: data['channelId'] as String?,
        isOwnerViewing: data['isOwnerViewing'] as bool?,
        shortDescription: data['shortDescription'] as String?,
        isCrawlable: data['isCrawlable'] as bool?,
        thumbnail: data['thumbnail'] == null
            ? null
            : Thumbnail.fromMap(data['thumbnail'] as Map<String, dynamic>),
        allowRatings: data['allowRatings'] as bool?,
        viewCount: data['viewCount'] as String?,
        author: data['author'] as String?,
        isPrivate: data['isPrivate'] as bool?,
        isUnpluggedCorpus: data['isUnpluggedCorpus'] as bool?,
        isLiveContent: data['isLiveContent'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'videoId': videoId,
        'title': title,
        'lengthSeconds': lengthSeconds,
        'keywords': keywords,
        'channelId': channelId,
        'isOwnerViewing': isOwnerViewing,
        'shortDescription': shortDescription,
        'isCrawlable': isCrawlable,
        'thumbnail': thumbnail?.toMap(),
        'allowRatings': allowRatings,
        'viewCount': viewCount,
        'author': author,
        'isPrivate': isPrivate,
        'isUnpluggedCorpus': isUnpluggedCorpus,
        'isLiveContent': isLiveContent,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VideoDetails].
  factory VideoDetails.fromJson(String data) {
    return VideoDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VideoDetails] to a JSON string.
  String toJson() => json.encode(toMap());
}
