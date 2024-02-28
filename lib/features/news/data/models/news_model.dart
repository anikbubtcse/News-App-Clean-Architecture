import 'package:news_app_clean_architecture/features/news/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({required String status, required List<ArticlesModel> articles})
      : super(status: status, articles: articles);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json["status"] ?? '',
      articles: json["articles"] != null
          ? List<ArticlesModel>.from(
              json["articles"].map((x) => ArticlesModel.fromJson(x)))
          : [],
    );
  }
}

class ArticlesModel extends ArticlesEntity {
  ArticlesModel(
      {required SourceModel source,
      required String author,
      required String title,
      required String description,
      required String url,
      required String urlToImage,
      required String content})
      : super(
            source: source,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            content: content);

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
        source: json["source"] != null
            ? SourceModel.fromJson(json["source"])
            : SourceModel.fromJson({}),
        author: json["author"] ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"] ?? '',
        content: json["content"] ?? '');
  }
}

class SourceModel extends SourceEntity {
  SourceModel({required String id, required String name})
      : super(id: id, name: name);

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json["id"] ?? '', name: json["name"] ?? '');
  }
}
