import 'dart:convert';

import 'featured_channel.dart';

class PlayerAnnotationsExpandedRenderer {
  FeaturedChannel? featuredChannel;
  bool? allowSwipeDismiss;
  String? annotationId;

  PlayerAnnotationsExpandedRenderer({
    this.featuredChannel,
    this.allowSwipeDismiss,
    this.annotationId,
  });

  factory PlayerAnnotationsExpandedRenderer.fromMap(Map<String, dynamic> data) {
    return PlayerAnnotationsExpandedRenderer(
      featuredChannel: data['featuredChannel'] == null
          ? null
          : FeaturedChannel.fromMap(
              data['featuredChannel'] as Map<String, dynamic>),
      allowSwipeDismiss: data['allowSwipeDismiss'] as bool?,
      annotationId: data['annotationId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'featuredChannel': featuredChannel?.toMap(),
        'allowSwipeDismiss': allowSwipeDismiss,
        'annotationId': annotationId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayerAnnotationsExpandedRenderer].
  factory PlayerAnnotationsExpandedRenderer.fromJson(String data) {
    return PlayerAnnotationsExpandedRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlayerAnnotationsExpandedRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
