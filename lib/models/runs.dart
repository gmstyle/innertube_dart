class Runs {
  final List<Run>? runs;

  Runs({this.runs});

  factory Runs.fromJson(Map<String, dynamic> json) {
    return Runs(
      runs: json['runs'] != null
          ? (json['runs'] as List).map((i) => Run.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'runs': runs?.map((e) => e.toJson()).toList(),
    };
  }
}

class Run {
  final String? text;
  final String? navigationEndpoint;

  Run({this.text, this.navigationEndpoint});

  factory Run.fromJson(Map<String, dynamic> json) {
    return Run(
      text: json['text'],
      navigationEndpoint: json['navigationEndpoint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'navigationEndpoint': navigationEndpoint,
    };
  }
}
