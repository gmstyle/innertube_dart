import 'dart:convert';

import 'ad_layout_metadata.dart';
import 'linear_ad.dart';

class LinearAdSequenceRenderer {
  List<LinearAd>? linearAds;
  AdLayoutMetadata? adLayoutMetadata;

  LinearAdSequenceRenderer({this.linearAds, this.adLayoutMetadata});

  factory LinearAdSequenceRenderer.fromMap(Map<String, dynamic> data) {
    return LinearAdSequenceRenderer(
      linearAds: (data['linearAds'] as List<dynamic>?)
          ?.map((e) => LinearAd.fromMap(e as Map<String, dynamic>))
          .toList(),
      adLayoutMetadata: data['adLayoutMetadata'] == null
          ? null
          : AdLayoutMetadata.fromMap(
              data['adLayoutMetadata'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'linearAds': linearAds?.map((e) => e.toMap()).toList(),
        'adLayoutMetadata': adLayoutMetadata?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LinearAdSequenceRenderer].
  factory LinearAdSequenceRenderer.fromJson(String data) {
    return LinearAdSequenceRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LinearAdSequenceRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
