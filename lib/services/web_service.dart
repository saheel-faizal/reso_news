import 'package:dio/dio.dart';
import 'package:reso_news/model/news_article.dart';

class WebService{
  var dio = Dio();
  String apiKey = "80af82a2d9e94caf8edda7de8991df60";

  Future <List<NewsArticle>> fetchTopHeadlines() async{
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2022-04-18&sortBy=publishedAt&apiKey=$apiKey";

    final response = await dio.get(url);

    if(response.statusCode == 200){
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }else{
      throw Exception("failed");
    }
    

  }
}