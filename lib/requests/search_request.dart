import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_base.dart';
import 'package:innertube_dart/mappers/search_response_mapper.dart';
import 'package:innertube_dart/models/responses/search_response.dart';
import 'package:innertube_dart/utils/utils.dart';

class SearchRequest extends InnertubeBase {
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

    List<dynamic>? itemSectionRenderer;
    Map<String, dynamic>? continuationItemRenderer;

    if (continuationToken == null) {
      final contents = response['contents']['twoColumnSearchResultsRenderer']
          ['primaryContents']['sectionListRenderer']['contents'];
      itemSectionRenderer = Utils.filterSearchContents(contents);
      continuationItemRenderer =
          (contents as List<dynamic>).last['continuationItemRenderer'];
    } else {
      if (response['onResponseReceivedCommands'] != null &&
          response['onResponseReceivedCommands'].isNotEmpty) {
        final continuationItems = response['onResponseReceivedCommands'][0]
            ['appendContinuationItemsAction']['continuationItems'];
        itemSectionRenderer = Utils.filterSearchContents(continuationItems);
        continuationItemRenderer = (continuationItems as List<dynamic>)
            .last['continuationItemRenderer'];
      } else {
        itemSectionRenderer = [];
        continuationItemRenderer = {};
      }
    }

    final data = {
      'contents': itemSectionRenderer,
      'continuationItemRenderer': continuationItemRenderer
    };

    return _searchResponseMapper.toModel(data);
  }
}
