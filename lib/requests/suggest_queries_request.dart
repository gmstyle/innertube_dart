import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:innertube_dart/innertube_base.dart';

class SuggestQueriesRequests extends InnertubeBase {
  final Locale? locale;

  SuggestQueriesRequests({this.locale = const Locale('en', 'US')});

  Future<List<String>?> suggestQuesries(String query) async {
    final url =
        Uri.https('suggestqueries-clients6.youtube.com', '/complete/search', {
      'client': 'youtube',
      'hl': locale?.languageCode,
      'gl': locale?.countryCode,
      'sugexp':
          'uqap13nsmic_c%2Cytpo.bo.me%3D0%2Cytposo.bo.me%3D0%2Cytpo.bo.ro.mi%3D51058272%2Cytposo.bo.ro.mi%3D51058272%2Ccfro%3D1%2Cytpo.bo.me%3D1%2Cytposo.bo.me%3D1%2Cytpo.bo.ro.mi%3D51067760%2Cytposo.bo.ro.mi%3D51067760',
      'gs_rn': '64',
      'gs_ri': 'youtube',
      'ds': 'yt',
      'cp': '6',
      'gs_id': 'o',
      'q': query,
      'xhr': 't'
    });
    final response = await client.get(url);
    if (response.statusCode != 200) {
      return null;
    }

    final jsonResponse = jsonDecode(response.body);
    final suggestionsArray = jsonResponse[1] as List<dynamic>;

    final suggestions = suggestionsArray.map((e) => e[0] as String).toList();

    return suggestions;
  }
}
