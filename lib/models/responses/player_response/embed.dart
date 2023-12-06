import 'dart:convert';

class Embed {
  String? iframeUrl;
  int? width;
  int? height;

  Embed({this.iframeUrl, this.width, this.height});

  factory Embed.fromMap(Map<String, dynamic> data) => Embed(
        iframeUrl: data['iframeUrl'] as String?,
        width: data['width'] as int?,
        height: data['height'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'iframeUrl': iframeUrl,
        'width': width,
        'height': height,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Embed].
  factory Embed.fromJson(String data) {
    return Embed.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Embed] to a JSON string.
  String toJson() => json.encode(toMap());
}
