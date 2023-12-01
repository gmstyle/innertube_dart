import 'package:json_annotation/json_annotation.dart';

part 'continuation.g.dart';

@JsonSerializable()
class Continuation {
  @JsonKey(name: 'nextContinuationData')
  final Data? nextContinuationData;

  Continuation({this.nextContinuationData});

  factory Continuation.fromJson(Map<String, dynamic> json) {
    json['nextContinuationData'] ??= json['nextRadioContinuationData'];
    return _$ContinuationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContinuationToJson(this);
}

@JsonSerializable()
class Data {
  final String? continuation;

  Data({this.continuation});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
