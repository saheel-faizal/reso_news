import 'package:reso_news/model/news_article.dart';

class NewsArticleViewModel{
  NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle article}) : _newsArticle = article;

  String get title => _newsArticle.title;

  String get url => _newsArticle.url;

  String get author => _newsArticle.author;

  String get content => _newsArticle.content;

  String get description => _newsArticle.description;

  DateTime get publishedAt => _newsArticle.publishedAt;

  String get urlToImage => _newsArticle.urlToImage;
}