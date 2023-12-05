import 'package:json_annotation/json_annotation.dart';

part 'response_context.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseContext {
  final String? function;
  final String? browseId;
  final String? context;
  final String? visitorData;
  final Client client;
  final Request request;
  final Flags flags;

  ResponseContext({
    this.function,
    this.browseId,
    this.context,
    this.visitorData,
    required this.client,
    required this.request,
    required this.flags,
  });

  factory ResponseContext.fromJson(Map<String, dynamic> json) =>
      _$ResponseContextFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseContextToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Request {
  final String? type;
  final String? id;

  Request({this.type, this.id});

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Client {
  final String? name;
  final String? version;

  Client({this.name, this.version});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Flags {
  final bool? isLoggedin;

  Flags({this.isLoggedin});

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);

  Map<String, dynamic> toJson() => _$FlagsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResponseFingerprint {
  final String? request;
  final String? function;
  final String? browseId;
  final String? context;
  final String? client;

  ResponseFingerprint({
    this.request,
    this.function,
    this.browseId,
    this.context,
    this.client,
  });

  factory ResponseFingerprint.fromJson(Map<String, dynamic> json) =>
      _$ResponseFingerprintFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseFingerprintToJson(this);
}
