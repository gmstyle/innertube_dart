import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innertube_dart/configuration/api.dart';
import 'package:innertube_dart/models/client_context.dart';
import 'package:innertube_dart/configuration/configuration.dart'
    as configuration;

class InnertubeAdaptor {
  final ClientContext context;
  final http.Client client;

  InnertubeAdaptor({required this.context, http.Client? client})
      : client = client ?? http.Client();

  @override
  String toString() {
    return 'InnertubeAdaptor{context: $context, client: $client}';
  }

  Future<Map<String, dynamic>> dispatch(String endpoint,
      Map<String, dynamic>? params, Map<String, dynamic>? body) async {
    final url = Uri.parse(configuration.config.baseUrl + endpoint);
    final headers =
        context.headers.map((key, value) => MapEntry(key, value.toString()));
    final requestBody = Api.contextualise(context, body ?? {});
    final response = await client.post(
      url,
      headers: headers,
      body: requestBody,
    );

    final contentType = response.headers['content-type'];

    if (contentType != null && !contentType.contains('application/json')) {
      throw Exception('Response content-type is not json');
    }

    if (response.statusCode != 200) {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }

    final jsonResponse = jsonDecode(response.body);

    final visitorData = jsonResponse['responseContext']['visitorData'];
    if (visitorData != null) {
      response.headers['X-Goog-Visitor-Id'] = visitorData;
    }

    final error = jsonResponse['error'];
    if (error != null) {
      throw Exception('Request failed with error: ${Api.getError(error)}.');
    }

    return jsonResponse;
  }
}
