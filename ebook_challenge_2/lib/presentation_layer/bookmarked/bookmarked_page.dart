import 'dart:convert';

import 'package:ebook_challenge_2/data_layer/model/book_model.dart';
import 'package:ebook_challenge_2/infra/utils/utils.dart';
import 'package:ebook_challenge_2/presentation_layer/bookshelf/bookshelf_page.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  final BookModel bookModel;

  const BookmarkPage({super.key, this.bookModel = const BookModel()});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<BookModel> bookshelfBookmarked = [];

  @override
  void initState() {
    loadBookmarks();
    super.initState();
  }

  void loadBookmarks() async {
    bookshelfBookmarked = await BookService().loadBooks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: BookShelfPage(bookshelf: bookshelfBookmarked),
    );
  }
}
