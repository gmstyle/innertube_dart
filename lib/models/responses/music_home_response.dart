class MusicHomeResponse {
  final String? title;
  final String? description;
  final List<dynamic>? carouselItems;
  final List<dynamic>? thumbnails;
  final List<dynamic>? sections;

  MusicHomeResponse({
    this.title,
    this.description,
    this.carouselItems,
    this.thumbnails,
    this.sections,
  });

  factory MusicHomeResponse.fromJson(Map<String, dynamic> json) {
    return MusicHomeResponse(
      title: json['title'],
      description: json['description'],
      carouselItems: json['carouselItems'],
      thumbnails: json['thumbnails'],
      sections: json['sections'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'carouselItems': carouselItems,
      'thumbnails': thumbnails,
      'sections': sections,
    };
  }
}
