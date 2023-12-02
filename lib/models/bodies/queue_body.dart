import 'package:innertube_dart/models/context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'queue_body.g.dart';

@JsonSerializable(explicitToJson: true)
class QueueBody {
  final Context context;
  final List<String>? videoIds;
  final String? playlistId;

  QueueBody({
    this.context = Context.defaultWeb,
    this.videoIds,
    this.playlistId,
  });

  factory QueueBody.fromJson(Map<String, dynamic> json) =>
      _$QueueBodyFromJson(json);

  Map<String, dynamic> toJson() => _$QueueBodyToJson(this);
}
