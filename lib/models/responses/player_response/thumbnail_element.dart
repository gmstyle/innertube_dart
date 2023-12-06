import 'dart:convert';

class ThumbnailElements {
  ThumbnailElements({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  factory ThumbnailElements.fromMap(Map<String, dynamic> data) =>
      ThumbnailElements(
        url: data["url"],
        width: data["width"],
        height: data["height"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "width": width,
        "height": height,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ThumbnailElements].
  factory ThumbnailElements.fromJson(String data) {
    return ThumbnailElements.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  /// Converts [ThumbnailElements] to a JSON string.
  ///
  String toJson() => json.encode(toMap());
}
