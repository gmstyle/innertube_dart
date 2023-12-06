import 'dart:convert';

import 'thumbnail.dart';

class Watermark {
  List<Thumbnail>? thumbnails;

  Watermark({this.thumbnails});

  factory Watermark.fromMap(Map<String, dynamic> data) => Watermark(
        thumbnails: (data['thumbnails'] as List<dynamic>?)
            ?.map((e) => Thumbnail.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'thumbnails': thumbnails?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Watermark].
  factory Watermark.fromJson(String data) {
    return Watermark.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Watermark] to a JSON string.
  String toJson() => json.encode(toMap());
}
