import 'package:flutter/material.dart';
import 'package:reso_news/model/news_article.dart';
import 'package:reso_news/services/web_service.dart';
import 'package:reso_news/viewmodels/news_article_view_model.dart';

enum LoadingStatus{
  completed,
  loading,
  empty
}

class NewsArticleListViewModel extends ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = [];

  void topHeadlines() async{
    List<NewsArticle> newsArticle = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.loading;
    notifyListeners();

    articles = newsArticle.map((article) => NewsArticleViewModel(article: article)).toList();
    print(articles);

    if(articles.isEmpty){
      loadingStatus = LoadingStatus.empty;
    }else{
      loadingStatus = LoadingStatus.completed;
    }
  }

}