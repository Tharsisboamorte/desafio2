
import 'package:flutter/material.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

import '../../data_layer/model/book_model.dart';
import '../../infra/utils/utils.dart';
import 'bookmark_iconButton.dart';

class EbookListItem extends StatefulWidget {
  final BookModel bookModel;

  const EbookListItem({
    super.key,
    required this.bookModel,
  });

  @override
  State<EbookListItem> createState() => _EbookListItemState();
}

class _EbookListItemState extends State<EbookListItem> {
  bool isBookMarked = true;

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, bottom: 4.0),
          child: InkWell(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              downloadAndOpenEbook(widget.bookModel.downloadUrl);
            },
            child: SizedBox(
              width: 100,
              height: 130,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.bookModel.coverUrl,
                    width: sizeScreen.width,
                    height: 150,
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: BookmarkIconButton(),
                  ),
                ],
              ),
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

  Future<void> downloadAndOpenEbook(String url) async {
    VocsyEpub.setConfig();

  }
}
