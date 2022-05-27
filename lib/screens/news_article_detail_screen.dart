import 'package:flutter/material.dart';
import 'package:reso_news/constants/colors.dart';
import 'package:reso_news/db/functions/db_function.dart';
import 'package:reso_news/db/modeldb/data_model.dart';

import '../viewmodels/news_article_view_model.dart';
import '../widgets/circle_image.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  const NewsArticleDetailScreen({Key? key, required this.article})
      : super(key: key);

  Future<void> addtoBookmark() async {
    final _boorkmarked = BookmarkedNews(
      author: article.author,
      content: article.content,
      publishedAt: article.publishedAt,
      description: article.description,
      title: article.title,
      url: article.url,
      urlToImage: article.urlToImage,
    );
    addBookmark(_boorkmarked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            const SizedBox(
              width: 5,
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 150,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Author',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    article.author.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kBlueGrey900),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  alignment: Alignment.centerLeft,
                  children: const <Widget>[
                    Divider(
                      height: 80,
                      color: Color(0xffFF8A30),
                      thickness: 20,
                    ),
                    Text(
                      ' Headline',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  article.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    wordSpacing: 3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  article.publishedAt.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: CircleImage(
                    imageUrl: article.urlToImage,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  article.description,
                  style: const TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addtoBookmark();
          },
          child: const Icon(Icons.star_border_outlined)),
    );
  }
}
