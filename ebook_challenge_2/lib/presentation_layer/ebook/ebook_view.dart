import 'package:ebook_challenge_2/data_layer/model/book_model.dart';
import 'package:flutter/material.dart';

class EbookViewPage extends StatefulWidget {

  const EbookViewPage(
      {super.key,});

  @override
  State<EbookViewPage> createState() => _EbookViewPageState();
}

class _EbookViewPageState extends State<EbookViewPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
