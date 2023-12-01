import 'package:json_annotation/json_annotation.dart';

part 'thumbnail.g.dart';

@JsonSerializable()
class Thumbnail {
  final String url;
  final int? width;
  final int? height;

  Thumbnail({required this.url, this.width, this.height});

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return _$ThumbnailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);

  bool get isResizable => !url.startsWith('https://i.ytimg.com');

  String size(int size) {
    return switch (url) {
      _ when url.startsWith('https://lh3.googleusercontent.com ') =>
        '$url-w$size-h$size',
      _ when url.startsWith('https://yt3.ggpht.com') => '$url-s$size',
      _ => url
    };
  }
}
