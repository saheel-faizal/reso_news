import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reso_news/constants/colors.dart';
import 'package:reso_news/screens/bookmarked_news_screen.dart';
import 'package:reso_news/viewmodels/news_article_list_viewmodel.dart';
import 'package:reso_news/widgets/news_grid.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [const NewsGrids(), const BookmarkedNewsScreen()];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kBlueGrey900),
        backgroundColor: kWhite,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newSelectedIndex) {
            setState(() {
              selectedIndex = newSelectedIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border_outlined), label: "Bookmarks")
          ]),
    );
  }
}

class NewsGrids extends StatefulWidget {
  const NewsGrids({Key? key}) : super(key: key);

  @override
  State<NewsGrids> createState() => _NewsGridsState();
}

class _NewsGridsState extends State<NewsGrids> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var newsListModel = Provider.of<NewsArticleListViewModel>(context);
    return DelayedWidget(
      delayDuration: const Duration(milliseconds: 200),
      animationDuration: const Duration(seconds: 1),
      animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Hey User",
              style: TextStyle(
                  fontSize: 30,
                  color: kBlueGrey700,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            color: kdeepOrangeCustom,
            thickness: 8,
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text(
              "Headline",
              style: TextStyle(
                  color: kBlueGrey900,
                  fontSize: 20,
                  letterSpacing: 0.4,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: NewsGrid(
              articles: newsListModel.articles,
            ),
          ),
        ],
      ),
    );
  }
}
