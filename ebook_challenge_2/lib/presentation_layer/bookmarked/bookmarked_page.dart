import 'package:ebook_challenge_2/data_layer/model/book_model.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: ,
    );
  }
}
