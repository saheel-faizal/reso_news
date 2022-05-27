import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reso_news/constants/colors.dart';
import 'package:reso_news/db/modeldb/data_model.dart';
import 'package:reso_news/screens/news_screen.dart';
import 'package:reso_news/viewmodels/news_article_list_viewmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(BookmarkedNewsAdapter().typeId)) {
    Hive.registerAdapter(BookmarkedNewsAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kWhite,
        appBarTheme: AppBarTheme(
            color: kWhite,
            elevation: 0,
            iconTheme: IconThemeData(color: kBlueGrey900),
            actionsIconTheme: IconThemeData(color: kBlueGrey900)),
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => NewsArticleListViewModel())
      ], child: const NewsScreen()),
    );
  }
}
