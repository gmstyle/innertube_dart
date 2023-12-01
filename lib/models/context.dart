import 'package:json_annotation/json_annotation.dart';

part 'context.g.dart';

@JsonSerializable()
class Context {
  final Client client;
  final ThirdParty? thirdParty;

  Context({
    required this.client,
    this.thirdParty,
  });

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);

  Map<String, dynamic> toJson() => _$ContextToJson(this);
}

@JsonSerializable()
class Client {
  final String clientName;
  final String clientVersion;
  final String platform;
  final String hl = 'en';
  final String visitorData = 'CgtEUlRINDFjdm1YayjX1pSaBg%3D%3D';
  final int? androidSdkVersion;
  final String? userAgent;

  Client({
    required this.clientName,
    required this.clientVersion,
    required this.platform,
    this.androidSdkVersion,
    this.userAgent,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);

  static Context defaultWeb = Context(
    client: Client(
        clientName: 'WEB_REMIX',
        clientVersion: '1.20220918',
        platform: 'DESKTOP'),
  );

  static Context defaultAndroid = Context(
    client: Client(
      clientName: 'ANDROID_MUSIC',
      clientVersion: '5.28.1',
      platform: 'MOBILE',
      androidSdkVersion: 30,
      userAgent:
          'com.google.android.apps.youtube.music/5.28.1 (Linux; U; Android 11) gzip',
    ),
  );

  static Context defaultAgeRestrictionBypass = Context(
      client: Client(
          clientName: 'TVHTML5_SIMPLY_EMBEDDED_PLAYER',
          clientVersion: '2.0',
          platform: 'TV'));
}

@JsonSerializable()
class ThirdParty {
  final String? embedUrl;

  ThirdParty({this.embedUrl});

  factory ThirdParty.fromJson(Map<String, dynamic> json) =>
      _$ThirdPartyFromJson(json);

  Map<String, dynamic> toJson() => _$ThirdPartyToJson(this);
}
