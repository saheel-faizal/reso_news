import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../modeldb/data_model.dart';

ValueNotifier<List<BookmarkedNews>> bookmarkedNotifier = ValueNotifier([]);

Future<void> addBookmark(BookmarkedNews bookmarkedNews) async {
  final _bookmarkDB = await Hive.openBox<BookmarkedNews>('bookmark_db');
  await _bookmarkDB.add(bookmarkedNews);
  bookmarkedNotifier.value.add(bookmarkedNews);
  bookmarkedNotifier.notifyListeners();
}

Future<void> getAlBookmarks() async {
  final _bookmarkDB = await Hive.openBox<BookmarkedNews>('bookmark_db');
  bookmarkedNotifier.value.clear();
  bookmarkedNotifier.value.addAll(_bookmarkDB.values);
  bookmarkedNotifier.notifyListeners();
}
