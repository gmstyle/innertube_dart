class Channel {
  String? channelId;
  String? title;
  String? description;
  List<Map<String, dynamic>>? thumbnails;
  String? videoCount;
  String? subscriberCount;

  Channel({
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.videoCount,
    this.subscriberCount,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        channelId: json['channelId'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        thumbnails: (json['thumbnails'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        videoCount: json['videoCount'] as String?,
        subscriberCount: json['subscriberCount'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'channelId': channelId,
        'title': title,
        'description': description,
        'thumbnails': thumbnails?.map((e) => e).toList(),
        'videoCount': videoCount,
        'subscriberCount': subscriberCount,
      };
}
