import 'package:ebook_challenge_2/presentation_layer/bookmarked/bookmarked_page.dart';
import 'package:ebook_challenge_2/presentation_layer/ebook/ebook_view.dart';
import 'package:flutter/material.dart';
import 'presentation_layer/home/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    routes: {
      '/home': (_) => const HomePage(),
      '/bookmark': (_) => const BookmarkPage(),
      '/ebookView': (_) => const EbookViewPage(),
    },
  ));
}
