
import 'package:flutter/material.dart';

import '../../data_layer/model/book_model.dart';
import '../../data_layer/source/api/api_call.dart';
import '../bookshelf/bookshelf_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiCall apiCall = ApiCall();
  List<BookModel> bookshelf = [];
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    _loadBooks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca'),
        actions: [
          TextButton(
            onPressed: () {
              
            },
            child: const Text('Favoritos'),
          )
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : BookShelfPage(bookshelf: bookshelf),
    );
  }

  void _loadBooks() async {
    await apiCall.fetchBooks().then((value) => bookshelf.addAll(value));
    if (bookshelf.isNotEmpty) {
      setState(() {
        loading = false;
      });
    }
  }
}
