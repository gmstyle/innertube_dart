import 'package:innertube_dart/models/context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'browse_body.g.dart';

@JsonSerializable(explicitToJson: true)
class BrowseContext {
  final Context context;
  final String browseId;
  final String? params;

  BrowseContext({Context? context, required this.browseId, this.params})
      : context = Context.defaultWeb;

  factory BrowseContext.fromJson(Map<String, dynamic> json) =>
      _$BrowseContextFromJson(json);

  Map<String, dynamic> toJson() => _$BrowseContextToJson(this);
}
