import 'dart:convert';

class StaticPreview {
  String? text;
  bool? isTemplated;
  String? trackingParams;

  StaticPreview({this.text, this.isTemplated, this.trackingParams});

  factory StaticPreview.fromMap(Map<String, dynamic> data) => StaticPreview(
        text: data['text'] as String?,
        isTemplated: data['isTemplated'] as bool?,
        trackingParams: data['trackingParams'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'text': text,
        'isTemplated': isTemplated,
        'trackingParams': trackingParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StaticPreview].
  factory StaticPreview.fromJson(String data) {
    return StaticPreview.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StaticPreview] to a JSON string.
  String toJson() => json.encode(toMap());
}
