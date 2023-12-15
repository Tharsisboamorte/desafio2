
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkIconButton extends StatefulWidget {
  final int index;
  const BookmarkIconButton(
      {super.key, required this.index,});

  @override
  State<BookmarkIconButton> createState() => _BookmarkIconButtonState();
}

class _BookmarkIconButtonState extends State<BookmarkIconButton> {
  final List<bool> _isBookMarked = List.generate(10, (index) => false);

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

  _saveButtonState(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('buttonState$index', _isBookMarked[index]);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: SvgPicture.asset(
        _isBookMarked[widget.index]
            ? 'assets/bookmark_on.svg'
            : 'assets/bookmark_off.svg',
        height: 35,
        width: 20,
      ),
      onPressed: () {
        setState(() {
          _isBookMarked[widget.index] = !_isBookMarked[widget.index];
          _saveButtonState(widget.index);
        });
      },
    );
  }
}
