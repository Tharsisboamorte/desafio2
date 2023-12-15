import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkIconButton extends StatefulWidget {

  const BookmarkIconButton(
      {super.key});

  @override
  State<BookmarkIconButton> createState() => _BookmarkIconButtonState();
}

class _BookmarkIconButtonState extends State<BookmarkIconButton> {
  bool _isBookMarked = false;

  @override
  void initState() {
    _loadButtonState();
    super.initState();
  }

  _loadButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isBookMarked = (prefs.getBool('buttonState') ?? false);
    });
  }

  _saveButtonState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('buttonState', _isBookMarked);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: SvgPicture.asset(
        _isBookMarked
            ? 'assets/bookmark_on.svg'
            : 'assets/bookmark_off.svg',
        height: 35,
        width: 20,
      ),
      onPressed: () {
        setState(() {
          _isBookMarked = !_isBookMarked;
          _saveButtonState();
          // Add to Favorite Section
        });
      },
    );
  }
}
