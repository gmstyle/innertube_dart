import 'package:innertube_dart/models/next_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_queue_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetQueueResponse {
  final List<QueueData>? queueDatas;

  GetQueueResponse(this.queueDatas);

  factory GetQueueResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQueueResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class QueueData {
  final PlaylistPanelRendererContent content;

  QueueData(this.content);

  factory QueueData.fromJson(Map<String, dynamic> json) {
    return _$QueueDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QueueDataToJson(this);
}
