import 'package:innertube_dart/models/locale.dart';
import 'package:innertube_dart/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_context.g.dart';

@JsonSerializable(explicitToJson: true)
class ClientContext {
  final String clientName;
  final String clientVersion;
  final int? clientId;
  final String? apiKey;
  final String? userAgent;
  final String? referer;
  final Locale? locale;

  ClientContext({
    required this.clientName,
    required this.clientVersion,
    this.clientId,
    this.apiKey,
    this.userAgent,
    this.referer,
    this.locale,
  });

  factory ClientContext.fromJson(Map<String, dynamic> json) {
    return _$ClientContextFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClientContextToJson(this);

  Map<String, dynamic> get params => Utils.filterNull({
        'key': apiKey,
        'alt': 'json',
      });

  Map<String, dynamic> get context => {
        'clientName': clientName,
        'clientVersion': clientVersion,
      };

  Map<String, dynamic> get headers => Utils.filterNull({
        'X-Goog-Api-Format-Version': '1',
        'X-YouTube-Client-Name': clientId?.toString(),
        'X-YouTube-Client-Version': clientVersion,
        'User-Agent': userAgent,
        'Referer': referer,
        'Accept-Language': locale?.acceptLenguage,
      });
}
