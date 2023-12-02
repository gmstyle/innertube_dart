import 'package:innertube_dart/models/context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'continuation_body.g.dart';

@JsonSerializable(explicitToJson: true)
class ContinuationBody {
  final Context context;
  final String continuation;

  ContinuationBody({Context? context, required this.continuation})
      : context = Context.defaultWeb;

  factory ContinuationBody.fromJson(Map<String, dynamic> json) =>
      _$ContinuationBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ContinuationBodyToJson(this);
}
