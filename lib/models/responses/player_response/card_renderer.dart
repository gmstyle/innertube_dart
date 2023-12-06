import 'dart:convert';

import 'cue_range.dart';
import 'teaser.dart';

class CardRenderer {
  Teaser? teaser;
  List<CueRange>? cueRanges;
  String? trackingParams;

  CardRenderer({this.teaser, this.cueRanges, this.trackingParams});

  factory CardRenderer.fromMap(Map<String, dynamic> data) => CardRenderer(
        teaser: data['teaser'] == null
            ? null
            : Teaser.fromMap(data['teaser'] as Map<String, dynamic>),
        cueRanges: (data['cueRanges'] as List<dynamic>?)
            ?.map((e) => CueRange.fromMap(e as Map<String, dynamic>))
            .toList(),
        trackingParams: data['trackingParams'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'teaser': teaser?.toMap(),
        'cueRanges': cueRanges?.map((e) => e.toMap()).toList(),
        'trackingParams': trackingParams,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CardRenderer].
  factory CardRenderer.fromJson(String data) {
    return CardRenderer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CardRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
