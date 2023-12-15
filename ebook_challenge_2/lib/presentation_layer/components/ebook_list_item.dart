
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

import '../../data_layer/model/book_model.dart';
import '../../infra/utils/utils.dart';
import 'bookmark_iconButton.dart';

class EbookListItem extends StatefulWidget {
  final BookModel bookModel;
  final int index;

  const EbookListItem({
    super.key,
    required this.bookModel,
    required this.index,
  });

  @override
  State<EbookListItem> createState() => _EbookListItemState();
}

class _EbookListItemState extends State<EbookListItem> {
  final List<bool> _isBookMarked = List.generate(10, (index) => false);
  bool loading = true;

  @override
  void initState() {
    _loadButtonState();
    super.initState();
  }

  _loadButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < _isBookMarked.length; i++) {
        _isBookMarked[i] = (prefs.getBool('buttonState$i') ?? false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            downloadAndOpenBook(widget.bookModel.downloadUrl);
          },
          child: SizedBox(
            width: 100,
            height: 130,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  fit: BoxFit.fill,
                  widget.bookModel.coverUrl,
                  width: sizeScreen.width,
                  height: 150,
                ),
                Positioned(
                  top: -15,
                  right: -10,
                  child: BookmarkIconButton(
                    index: widget.index,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          widget.bookModel.title,
          style: CustomTextStyle().titleText,
          softWrap: true,
        ),
        Text(
          widget.bookModel.author,
          style: CustomTextStyle().authorText,
          softWrap: true,
        ),
      ],
    );
  }

  Future<void> downloadAndOpenBook(String downloadUrl) async {
    final dio = Dio();
    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/book.epub';

    await dio.download(downloadUrl, filePath).whenComplete(() {
      if (Platform.isAndroid) {
        VocsyEpub.open(filePath);
        VocsyEpub.setConfig(
            scrollDirection: EpubScrollDirection.VERTICAL,
            identifier: 'book'
        );
      } else if (Platform.isIOS) {
        VocsyEpub.open(filePath);
        VocsyEpub.setConfig(
            scrollDirection: EpubScrollDirection.VERTICAL,
            identifier: 'book'
        );
      }
    });
  }
}
