
import 'dart:convert';

import 'package:ebook_challenge_2/data_layer/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTextStyle {

  TextStyle titleText = const TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );
  TextStyle authorText = const TextStyle(
    fontSize: 12,
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );

}

class BookService {
  Future<void> saveBooks(BookModel book) async {
    final prefs = await SharedPreferences.getInstance();
    final List<BookModel> booksJson = [];
    booksJson.add(book);
    final bookshelf = jsonEncode(booksJson.map((bookElement) => book.toMap()).toList());
    await prefs.setString('books', bookshelf);
  }

  Future<List<BookModel>> loadBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final booksJson = prefs.getString('books');
    if (booksJson == null || booksJson.isEmpty) {
      return [];
    }
    final booksList = jsonDecode(booksJson) as List;
    return booksList.map((book) => BookModel.fromJson(book)).toList();
  }
}