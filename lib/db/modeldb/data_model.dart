import 'package:hive/hive.dart';
part 'data_model.g.dart';


@HiveType(typeId: 1)
class BookmarkedNews extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String urlToImage;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final DateTime publishedAt;
  @HiveField(6)
  final String content;

  BookmarkedNews(
      {required this.title,
      required this.author,
      required this.description,
      required this.urlToImage,
      required this.url,
      required this.publishedAt,
      required this.content});
}
