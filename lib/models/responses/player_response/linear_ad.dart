import 'dart:convert';

import 'instream_video_ad_renderer.dart';

class LinearAd {
  InstreamVideoAdRenderer? instreamVideoAdRenderer;

  LinearAd({this.instreamVideoAdRenderer});

  factory LinearAd.fromMap(Map<String, dynamic> data) => LinearAd(
        instreamVideoAdRenderer: data['instreamVideoAdRenderer'] == null
            ? null
            : InstreamVideoAdRenderer.fromMap(
                data['instreamVideoAdRenderer'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'instreamVideoAdRenderer': instreamVideoAdRenderer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LinearAd].
  factory LinearAd.fromJson(String data) {
    return LinearAd.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LinearAd] to a JSON string.
  String toJson() => json.encode(toMap());
}
