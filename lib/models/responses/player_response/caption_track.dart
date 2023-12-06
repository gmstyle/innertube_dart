import 'dart:convert';

import 'name.dart';

class CaptionTrack {
  String? baseUrl;
  Name? name;
  String? vssId;
  String? languageCode;
  String? kind;
  bool? isTranslatable;
  String? trackName;

  CaptionTrack({
    this.baseUrl,
    this.name,
    this.vssId,
    this.languageCode,
    this.kind,
    this.isTranslatable,
    this.trackName,
  });

  factory CaptionTrack.fromMap(Map<String, dynamic> data) => CaptionTrack(
        baseUrl: data['baseUrl'] as String?,
        name: data['name'] == null
            ? null
            : Name.fromMap(data['name'] as Map<String, dynamic>),
        vssId: data['vssId'] as String?,
        languageCode: data['languageCode'] as String?,
        kind: data['kind'] as String?,
        isTranslatable: data['isTranslatable'] as bool?,
        trackName: data['trackName'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'baseUrl': baseUrl,
        'name': name?.toMap(),
        'vssId': vssId,
        'languageCode': languageCode,
        'kind': kind,
        'isTranslatable': isTranslatable,
        'trackName': trackName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CaptionTrack].
  factory CaptionTrack.fromJson(String data) {
    return CaptionTrack.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CaptionTrack] to a JSON string.
  String toJson() => json.encode(toMap());
}
