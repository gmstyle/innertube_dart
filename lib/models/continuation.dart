class Continuation {
  final Data? nextContinuationData;

  Continuation({this.nextContinuationData});

  factory Continuation.fromJson(Map<String, dynamic> json) {
    return Continuation(
      nextContinuationData: (json['nextContinuationData'] != null
              ? Data.fromJson(json['nextContinuationData'])
              : null) ??
          (json['nextRadioContinuationData'] != null
              ? Data.fromJson(json['nextRadioContinuationData'])
              : null),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nextContinuationData': nextContinuationData?.toJson(),
    };
  }
}

class Data {
  final String? continuation;

  Data({this.continuation});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      continuation: json['continuation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'continuation': continuation,
    };
  }
}
