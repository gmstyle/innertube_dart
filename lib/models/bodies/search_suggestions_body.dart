import 'package:innertube_dart/models/context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_suggestions_body.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchSuggestionsBody {
  final Context context;
  final String input;

  SearchSuggestionsBody({
    this.context = Context.defaultWeb,
    required this.input,
  });

  factory SearchSuggestionsBody.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestionsBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSuggestionsBodyToJson(this);
}
