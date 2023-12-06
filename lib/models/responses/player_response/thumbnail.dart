import 'dart:convert';

import 'package:innertube_dart/models/responses/player_response/thumbnail_element.dart';

import 'thumbnail.dart';

class Thumbnail {
  List<ThumbnailElements>? thumbnails;

  Thumbnail({this.thumbnails});

  factory Thumbnail.fromMap(Map<String, dynamic> data) => Thumbnail(
        thumbnails: (data['thumbnails'] as List<dynamic>?)
            ?.map((e) => ThumbnailElements.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'thumbnails': thumbnails?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Thumbnail].
  factory Thumbnail.fromJson(String data) {
    return Thumbnail.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Thumbnail] to a JSON string.
  String toJson() => json.encode(toMap());
}
