import 'package:innertube_dart/models/navigation_endpoint.dart';

class ButtonRenderer {
  final NavigationEndpoint? navigationEndpoint;

  ButtonRenderer({this.navigationEndpoint});

  factory ButtonRenderer.fromJson(Map<String, dynamic> json) {
    return ButtonRenderer(
      navigationEndpoint: json['navigationEndpoint'] != null
          ? NavigationEndpoint.fromJson(json['navigationEndpoint'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'navigationEndpoint': navigationEndpoint?.toJson(),
    };
  }
}
