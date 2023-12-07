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
}
