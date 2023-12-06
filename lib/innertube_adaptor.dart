import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:innertube_dart/configuration/configuration.dart';

import 'models/requests/locale.dart';

class InnertubeAdaptor {
  final http.Client client;

  InnertubeAdaptor({http.Client? client}) : client = http.Client();

  @override
  String toString() {
    return 'InnertubeAdaptor{context: , client: $client}';
  }

  Future<Map<String, dynamic>> dispatch(
    String endpoint, {
    Map<String, dynamic>? params,
    Locale? locale = const Locale(hl: 'en', gl: 'US'),
  }) async {
    final url = Uri.parse(API_BASE_URL + endpoint);
    final hl = locale!.hl;
    final gl = locale.gl;
    final Map<String, dynamic> body = {
      "context": {
        "client": {
          "hl": hl,
          "gl": gl,
          "clientName": WEB_CLIENT_NAME,
          "clientVersion": WEB_CLIENT_VERSION
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
      HttpHeaders.acceptLanguageHeader: locale.acceptLenguage,
      'X-Goog-Api-Key': API_KEY
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
