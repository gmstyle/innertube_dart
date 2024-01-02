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
  static List<dynamic> filterSearchContents(List<dynamic> contents) {
    final List<dynamic> filteredContents = [];
    for (final content in contents) {
      if (content['itemSectionRenderer'] != null) {
        filteredContents.addAll(filterSearchContents(
            content['itemSectionRenderer']['contents'] as List<dynamic>));
      } else if (content['videoRenderer'] != null ||
          content['channelRenderer'] != null ||
          content['playlistRenderer'] != null) {
        filteredContents.add(content);
      }
    }
    return filteredContents;
  }

  /// Sets the playlist ID based on the provided ID.
  ///
  /// To retrieve a given playlist, first, identify the playlist's ID.
  /// In a URL this will be the code after ?list=. For example:
  /// https://www.youtube.com/playlist?list=PLB7ZcpBcwdC7rGYl6StHarkLlgeZX66oL's ID will be PLB7ZcpBcwdC7rGYl6StHarkLlgeZX66oL.
  /// Playlist IDs will always begin with the string VLPL (case sensitive).
  /// For IDs retrieved from URLs, this will mean that you need to prepend VL to the ID.
  ///
  /// If the ID starts with 'PL', the prefix is replaced with 'VL'.
  /// If the ID starts with 'VL', the ID remains unchanged.
  ///
  /// Returns the modified playlist ID, or null if the provided ID is null.
  static String? setPlaylistId(String? id) {
    String? playlistId;

    if (id != null) {
      if (!id.startsWith('VL')) {
        playlistId = 'VL$id';
      } else if (id.startsWith('VL')) {
        playlistId = id;
      }
    }

    return playlistId;
  }

  /// Filters the given list of contents and returns a new list containing only the sections with shelfRenderer.
  ///
  /// The [contents] parameter is a list of dynamic objects representing the contents to be filtered.
  /// Each content object should have the structure:
  /// {
  ///   'itemSectionRenderer': {
  ///     'contents': [
  ///       {
  ///         'shelfRenderer': {
  ///           'title': {
  ///             'runs': [
  ///               {'text': 'section title'}
  ///             ]
  ///           },
  ///           'content': {
  ///             'horizontalListRenderer': {
  ///               'items': [
  ///                 // list of items
  ///               ]
  ///             }
  ///           }
  ///         }
  ///       }
  ///     ]
  ///   }
  /// }
  ///
  /// The method iterates over each content object and checks if it has a shelfRenderer.
  /// If it does, it extracts the section information and adds it to the filteredContents list.
  /// The section information is represented as a map with the following structure:
  /// {
  ///   'title': 'section title',
  ///   'playlistId': 'playlist id',
  ///   'contents': [
  ///     // list of items
  ///   ]
  /// }
  ///
  /// Returns a new list containing the filtered sections.
  static List<dynamic> filterChannelContents(List<dynamic> contents) {
    final List<dynamic> filteredContents = [];
    for (final content in contents) {
      final shelfRenderer =
          content['itemSectionRenderer']['contents'][0]['shelfRenderer'];
      if (shelfRenderer != null) {
        final browseEndPoint = shelfRenderer['title']['runs'][0]
            ['navigationEndpoint']['browseEndpoint'];
        final browseId =
            browseEndPoint != null ? browseEndPoint['browseId'] : null;
        final horizontalListRenderer =
            shelfRenderer['content']['horizontalListRenderer'];
        final expandedShelfContentsRenderer =
            shelfRenderer['content']['expandedShelfContentsRenderer'];
        final section = {
          'title': shelfRenderer['title']['runs'][0]['text'],
          'playlistId': browseId != null ? setPlaylistId(browseId) : null,
          'contents': horizontalListRenderer != null
              ? horizontalListRenderer['items']
              : expandedShelfContentsRenderer != null
                  ? expandedShelfContentsRenderer['items']
                  : null
        };
        filteredContents.add(section);
      }
    }
    return filteredContents;
  }

  static List<dynamic> filterMusicContents(List<dynamic> contents) {
    final List<dynamic> filteredContents = [];
    for (final content in contents) {
      final shelfRenderer =
          content['itemSectionRenderer']['contents'][0]['shelfRenderer'];
      if (shelfRenderer != null) {
        final section = {
          'title': shelfRenderer['title']['runs'][0]['text'],
          'contents': shelfRenderer['content']['horizontalListRenderer']
              ['items']
        };

        filteredContents.add(section);
      }
    }
    return filteredContents;
  }
}
