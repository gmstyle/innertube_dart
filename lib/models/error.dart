import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class Error {
  final int code;
  final String message;
  final String reason;

  Error({
    required this.code,
    required this.message,
    required this.reason,
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  String toString() {
    return 'Error: $code - $message - $reason';
  }
}
