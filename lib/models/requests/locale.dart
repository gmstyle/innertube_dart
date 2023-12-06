import 'package:innertube_dart/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'locale.g.dart';

@JsonSerializable()
class Locale {
  final String hl;
  final String? gl;

  const Locale({
    required this.hl,
    this.gl,
  });

  factory Locale.fromJson(Map<String, dynamic> json) => _$LocaleFromJson(json);

  Map<String, dynamic> toJson() => _$LocaleToJson(this);

  // Ritorna una stringa seprata da virgole con i valori non nulli di gl e hl della classe Locale
  String get acceptLenguage =>
      Utils.filterNull({'gl': gl, 'hl': hl}).values.join(',');
}
