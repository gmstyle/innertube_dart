import 'package:innertube_dart/models/navigation_endpoint.dart';
import 'package:json_annotation/json_annotation.dart';

part 'button_renderer.g.dart';

@JsonSerializable(explicitToJson: true)
class ButtonRenderer {
  final NavigationEndpoint? navigationEndpoint;

  ButtonRenderer({this.navigationEndpoint});

  factory ButtonRenderer.fromJson(Map<String, dynamic> json) {
    return _$ButtonRendererFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ButtonRendererToJson(this);
  }
}
