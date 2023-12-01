import 'package:innertube_dart/extensions/extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'runs.g.dart';

@JsonSerializable()
class Runs {
  final List<Run> runs;

  Runs({required this.runs});

  factory Runs.fromJson(Map<String, dynamic> json) {
    return _$RunsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RunsToJson(this);
  }

  String get text {
    return runs.map((run) => run.text).join('');
  }

  List<List<Run>> splitBySeparator() {
    return runs
        .asMap()
        .entries
        .expand((entry) {
          int index = entry.key;
          Run run = entry.value;
          if (index == 0 || index == runs.length - 1) {
            return [index];
          } else if (run.text == " • ") {
            return [index - 1, index + 1];
          } else {
            return [];
          }
        })
        .toList()
        .windowed(2, 2)
        .map((window) {
          int from = window[0];
          int to = window[1];
          return runs.sublist(from, to + 1);
        })
        .toList();
  }
}

@JsonSerializable()
class Run {
  final String? text;
  final String? navigationEndpoint;

  Run({this.text, this.navigationEndpoint});

  factory Run.fromJson(Map<String, dynamic> json) {
    return _$RunFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RunToJson(this);
  }
}
