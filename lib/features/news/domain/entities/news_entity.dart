class NewsEntity {
  final String status;
  final List<ArticlesEntity> articles;

  NewsEntity({required this.status, required this.articles});
}

class ArticlesEntity {
  final SourceEntity source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  ArticlesEntity(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content});
}

class SourceEntity {
  final String id;
  final String name;

  SourceEntity({required this.id, required this.name});
}
