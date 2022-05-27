class NewsArticle{

  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String url;
  final DateTime publishedAt;
  final String content;

  NewsArticle(
      {required this.title,
      required this.author,
      required this.description,
      required this.urlToImage,
      required this.url,
      required this.publishedAt,
      required this.content});


  factory NewsArticle.fromJson(Map<String,dynamic> json){
    return NewsArticle(
        title:json['title'],
        author:json['author'] ?? "",
        description:json['description'],
        urlToImage:json['urlToImage'] ?? "",
        url:json['url'],
        publishedAt:DateTime.parse(json["publishedAt"]),
        content: json['content']);
  }

}