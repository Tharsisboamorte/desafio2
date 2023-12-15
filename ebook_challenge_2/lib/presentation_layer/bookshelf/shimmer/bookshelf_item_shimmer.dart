import 'package:flutter/material.dart';

class BookShelfItemShimmer extends StatelessWidget {
  const BookShelfItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.black12,
          border: const Border.symmetric(),
          borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          Container(
            width: 150,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            width: 100,
            height: 20,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
