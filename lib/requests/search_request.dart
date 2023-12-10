import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/mappers/search_response_mapper.dart';
import 'package:innertube_dart/models/responses/search_response.dart';
import 'package:innertube_dart/utils/utils.dart';

class SearchRequest extends InnertubeAdaptor {
  final Locale? locale;

  SearchRequest({this.locale = const Locale('en', 'US')});

  final SearchResponseMapper _searchResponseMapper = SearchResponseMapper();

  Future<SearchResponse> search(
      {required String query, String? continuationToken}) async {
    final endpoint = Endpoint.search.name;
    final params = {
      'query': query,
      'continuation': continuationToken,
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    return _searchResponseMapper.toModel(response);
  }
}
