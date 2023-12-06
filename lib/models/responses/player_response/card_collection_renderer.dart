import 'dart:convert';

import 'card.dart';
import 'close_button.dart';
import 'header_text.dart';
import 'icon.dart';

class CardCollectionRenderer {
  List<Card>? cards;
  HeaderText? headerText;
  Icon? icon;
  CloseButton? closeButton;
  String? trackingParams;
  bool? allowTeaserDismiss;
  bool? logIconVisibilityUpdates;

  CardCollectionRenderer({
    this.cards,
    this.headerText,
    this.icon,
    this.closeButton,
    this.trackingParams,
    this.allowTeaserDismiss,
    this.logIconVisibilityUpdates,
  });

  factory CardCollectionRenderer.fromMap(Map<String, dynamic> data) {
    return CardCollectionRenderer(
      cards: (data['cards'] as List<dynamic>?)
          ?.map((e) => Card.fromMap(e as Map<String, dynamic>))
          .toList(),
      headerText: data['headerText'] == null
          ? null
          : HeaderText.fromMap(data['headerText'] as Map<String, dynamic>),
      icon: data['icon'] == null
          ? null
          : Icon.fromMap(data['icon'] as Map<String, dynamic>),
      closeButton: data['closeButton'] == null
          ? null
          : CloseButton.fromMap(data['closeButton'] as Map<String, dynamic>),
      trackingParams: data['trackingParams'] as String?,
      allowTeaserDismiss: data['allowTeaserDismiss'] as bool?,
      logIconVisibilityUpdates: data['logIconVisibilityUpdates'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'cards': cards?.map((e) => e.toMap()).toList(),
        'headerText': headerText?.toMap(),
        'icon': icon?.toMap(),
        'closeButton': closeButton?.toMap(),
        'trackingParams': trackingParams,
        'allowTeaserDismiss': allowTeaserDismiss,
        'logIconVisibilityUpdates': logIconVisibilityUpdates,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CardCollectionRenderer].
  factory CardCollectionRenderer.fromJson(String data) {
    return CardCollectionRenderer.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CardCollectionRenderer] to a JSON string.
  String toJson() => json.encode(toMap());
}
