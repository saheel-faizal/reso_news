import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reso_news/screens/news_article_detail_screen.dart';
import 'package:reso_news/viewmodels/news_article_view_model.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const NewsGrid({Key? key, required this.articles}) : super(key: key);

  void sendDetails(context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetailScreen(
                  article: article,
                )));
  }

  @override
  Widget build(BuildContext context) {
    var article;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          var article = articles[index];
          return GestureDetector(
            onTap: (){
                  sendDetails(context, article);
            },
            child: GridTile(
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    placeholder: (context, url) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  )),
              footer: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    article.title,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 1,
                  )),
            ),
          );
        });
  }
}
