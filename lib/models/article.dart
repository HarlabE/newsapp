class Article {
  final String title, description, urlToImage, url;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json["title"] ?? '',
      description: json["description"] ?? '',
      url: json["url"] ?? '',
      urlToImage: json["urlToImage"] ?? '',
    );
  }
}
