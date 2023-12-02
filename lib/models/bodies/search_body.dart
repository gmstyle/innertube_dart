import 'package:innertube_dart/models/context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_body.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchBody {
  final Context context;
  final String query;
  final String params;

  SearchBody({
    this.context = Context.defaultWeb,
    required this.query,
    required this.params,
  });

  factory SearchBody.fromJson(Map<String, dynamic> json) =>
      _$SearchBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SearchBodyToJson(this);
}
