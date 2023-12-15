import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';

import '../../model/book_model.dart';

class ApiCall {
  Future<List<BookModel>> fetchBooks() async {
    final dio = Dio();
    String url = 'https://escribo.com/books.json';
    List<BookModel> bookList = [];

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        bookList =
            (response.data as List).map((i) => BookModel.fromJson(i)).toList();
      } else {
        debugPrint('Failed to load books');
      }
    } catch (exception) {
      debugPrint('Request failed: $exception');
    }

    return bookList;
  }
}
