import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innertube_dart/configuration/configuration.dart';
import 'package:innertube_dart/utils/utils.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class InnertubeBase {
  final http.Client client;
  final YoutubeExplode yt = YoutubeExplode();

  InnertubeBase({http.Client? client}) : client = http.Client();

  @override
  String toString() {
    return 'InnertubeAdaptor{context: , client: $client}';
  }

  Future<Map<String, dynamic>> dispatch(
    String endpoint, {
    Map<String, dynamic>? params,
    Locale? locale = const Locale('en', 'US'),
  }) async {
    final url = Uri.parse(API_BASE_URL + endpoint);
    final hl = locale!.languageCode;
    final gl = locale.countryCode;
    final Map<String, dynamic> body = {
      "context": {
        "client": {
          "hl": hl,
          "gl": gl,
          "clientName": TV_CLIENT_NAME,
          "clientVersion": TV_CLIENT_VERSION,
          "timeZone": "UTC",
          'utcOffsetMinutes': 0,
        }
      },
      "racyCheckOk": true,
      "contentCheckOk": true
    };
    if (params != null) {
      body.addAll(params);
    }

    final headers = {
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.userAgentHeader: USER_AGENT_WEB,
      HttpHeaders.hostHeader: HOST,
      'Origin': REFERER_YOUTUBE,
      HttpHeaders.refererHeader: REFERER_YOUTUBE,
      HttpHeaders.acceptEncodingHeader: 'gzip, deflate',
      HttpHeaders.acceptLanguageHeader: Utils.acceptedLenguage(locale),
      'X-Goog-Api-Key': API_KEY,
      'prettyPrint': 'false',
    };

    try {
      final response = await client.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode != 200) {
        return Future.error(
            'Request failed with status: ${response.statusCode}.');
      }

      final jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } catch (e) {
      return Future.error(e);
    }
  }
}
