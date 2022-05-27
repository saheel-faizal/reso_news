import 'package:flutter/material.dart';
import 'package:reso_news/db/functions/db_function.dart';
import 'package:reso_news/db/modeldb/data_model.dart';

class BookmarkedNewsScreen extends StatelessWidget {
  const BookmarkedNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAlBookmarks();
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: bookmarkedNotifier,
          builder: (context, List<BookmarkedNews> bookmarkList, child) {
            return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = bookmarkList[index];
                  return ListTile(
                    
                    leading: Image.network(
                      data.urlToImage,
                    ),
                    title: Text(data.title),
                    subtitle: Text(data.description),
                    isThreeLine: true,
                    
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider();
                },
                itemCount: bookmarkList.length);
          }),
    );
  }
}
