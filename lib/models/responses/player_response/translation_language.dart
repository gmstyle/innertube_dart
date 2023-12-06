import 'dart:convert';

import 'language_name.dart';

class TranslationLanguage {
  String? languageCode;
  LanguageName? languageName;

  TranslationLanguage({this.languageCode, this.languageName});

  factory TranslationLanguage.fromMap(Map<String, dynamic> data) {
    return TranslationLanguage(
      languageCode: data['languageCode'] as String?,
      languageName: data['languageName'] == null
          ? null
          : LanguageName.fromMap(data['languageName'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'languageCode': languageCode,
        'languageName': languageName?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TranslationLanguage].
  factory TranslationLanguage.fromJson(String data) {
    return TranslationLanguage.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TranslationLanguage] to a JSON string.
  String toJson() => json.encode(toMap());
}
