import 'package:flutter/material.dart';
import 'package:innertube_dart/enums/enums.dart';
import 'package:innertube_dart/innertube_adaptor.dart';
import 'package:innertube_dart/mappers/trending_response_mapper.dart';
import 'package:innertube_dart/models/responses/trending_response.dart';
import 'package:innertube_dart/utils/utils.dart';

class TrendingRequest extends InnertubeAdaptor {
  final Locale? locale;

  TrendingRequest({this.locale = const Locale('en', 'US')});

  final TrendingResponseMapper _trendingResponseMapper =
      TrendingResponseMapper();

  Future<TrendingResponse> getTrending(
      {TrendingCategory? trendingCategory = TrendingCategory.now}) async {
    final endpoint = Endpoint.browse.name;
    final params = {
      'browseId': BrowseId.FEtrending.name,
      'params': trendingCategory?.param
    };

    final response = await dispatch(endpoint,
        params: Utils.filterNull(params), locale: locale);

    late int index;
    switch (trendingCategory) {
      case TrendingCategory.now:
        index = 0;
        break;
      case TrendingCategory.music:
        index = 1;
        break;
      case TrendingCategory.gaming:
        index = 2;
        break;
      case TrendingCategory.film:
        index = 3;
        break;
      default:
        index = 0;
    }

    return _trendingResponseMapper.toModel(
        response['contents']['twoColumnBrowseResultsRenderer']['tabs'][index]);
  }
}
