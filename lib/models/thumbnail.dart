class Thumbnail {
  final String url;
  final int? width;
  final int? height;

  Thumbnail({required this.url, this.width, this.height});

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }

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
