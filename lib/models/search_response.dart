import 'package:innertube_dart/models/tabs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResponse {
  final Contents? contents;

  SearchResponse(this.contents);

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Contents {
  final Tabs? tabbedSearchResultsRenderer;

  Contents(this.tabbedSearchResultsRenderer);

  factory Contents.fromJson(Map<String, dynamic> json) {
    return _$ContentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContentsToJson(this);
}
