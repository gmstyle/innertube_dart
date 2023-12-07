import 'package:flutter/material.dart';

class Utils {
  // Filtro la mappa per rimuovere le chiavi con valore null
  static Map<String, dynamic> filterNull(Map<String, dynamic> map) {
    return map..removeWhere((key, value) => value == null);
  }

  /// Returns the accepted language string for the given [locale].
  ///
  /// The accepted language string is in the format '${languageCode}-${countryCode},${languageCode};q=0.9'.
  /// The [languageCode] represents the language code of the locale, and the [countryCode] represents the country code.
  /// The 'q=0.9' represents the quality factor, indicating the preference for the language.
  ///
  /// Example:
  /// ```
  /// Locale locale = Locale('en', 'US');
  /// String acceptedLanguage = acceptedLenguage(locale);
  /// print(acceptedLanguage); // en-US,en;q=0.9
  /// ```
  static String acceptedLenguage(Locale locale) {
    return '${locale.languageCode}-${locale.countryCode},'
        '${locale.languageCode};q=0.9';
  }

  /// Filters the given list of contents and returns a new list containing only the desired content types.
  ///
  /// The function recursively filters the contents by checking if each content item is of type 'itemSectionRenderer',
  /// 'videoRenderer', 'channelRenderer', or 'playlistRenderer'. If the content item is of type 'itemSectionRenderer',
  /// it calls itself recursively to filter the contents within the 'itemSectionRenderer'. If the content item is of
  /// any of the desired types, it is added to the filtered list.
  ///
  /// Parameters:
  /// - contents: The list of contents to be filtered.
  ///
  /// Returns:
  /// A new list containing only the desired content types.
  static List<dynamic> filterContents(List<dynamic> contents) {
    final List<dynamic> filteredContents = [];
    for (final content in contents) {
      if (content['itemSectionRenderer'] != null) {
        filteredContents.addAll(filterContents(
            content['itemSectionRenderer']['contents'] as List<dynamic>));
      } else if (content['videoRenderer'] != null ||
          content['channelRenderer'] != null ||
          content['playlistRenderer'] != null) {
        filteredContents.add(content);
      }
    }
    return filteredContents;
  }
}
