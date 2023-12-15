import 'package:flutter/material.dart';

import '../../data_layer/model/book_model.dart';
import '../components/ebook_list_item.dart';

class BookShelfPage extends StatefulWidget {
  final List<BookModel> bookshelf;

  const BookShelfPage({
    super.key,
    required this.bookshelf,
  });

  @override
  State<BookShelfPage> createState() => _BookShelfPageState();
}

class _BookShelfPageState extends State<BookShelfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(5.0),
        children: List.generate(10, (index) {
          return Center(
            child: EbookListItem(
              bookModel: widget.bookshelf[index],
              index: index,
            ),
          );
        }),
      ),
    );
  }
}
