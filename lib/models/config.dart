import 'package:innertube_dart/models/client_context.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(explicitToJson: true)
class Config {
  final String baseUrl;
  final List<ClientContext> clients;

  Config({
    required this.baseUrl,
    required this.clients,
  });

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
