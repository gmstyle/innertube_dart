import 'package:innertube_dart/models/navigation_endpoint.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_suggestions_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchSuggestionsResponse {
  final SearchSuggestionsResponseContent? contents;

  SearchSuggestionsResponse({this.contents});

  factory SearchSuggestionsResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchSuggestionsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchSuggestionsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchSuggestionsResponseContent {
  final SearchSuggestionsSectionRenderer? searchSuggestionsSectionRenderer;

  SearchSuggestionsResponseContent({this.searchSuggestionsSectionRenderer});

  factory SearchSuggestionsResponseContent.fromJson(Map<String, dynamic> json) {
    return _$SearchSuggestionsResponseContentFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$SearchSuggestionsResponseContentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchSuggestionsSectionRenderer {
  final List<SearchSuggestionsSectionRendererContent> contents;

  SearchSuggestionsSectionRenderer({required this.contents});

  factory SearchSuggestionsSectionRenderer.fromJson(Map<String, dynamic> json) {
    return _$SearchSuggestionsSectionRendererFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$SearchSuggestionsSectionRendererToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchSuggestionsSectionRendererContent {
  final SearchSuggestionRenderer? searchSuggestionRenderer;

  SearchSuggestionsSectionRendererContent({this.searchSuggestionRenderer});

  factory SearchSuggestionsSectionRendererContent.fromJson(
      Map<String, dynamic> json) {
    return _$SearchSuggestionsSectionRendererContentFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$SearchSuggestionsSectionRendererContentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchSuggestionRenderer {
  final NavigationEndpoint? navigationEndpoint;

  SearchSuggestionRenderer({this.navigationEndpoint});

  factory SearchSuggestionRenderer.fromJson(Map<String, dynamic> json) {
    return _$SearchSuggestionRendererFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchSuggestionRendererToJson(this);
}
