import 'package:ebook_challenge_2/presentation_layer/bookshelf/shimmer/bookshelf_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookshelfShimmer extends StatefulWidget {
  const BookshelfShimmer({super.key});

  @override
  State<BookshelfShimmer> createState() => _BookshelfShimmerState();
}

class _BookshelfShimmerState extends State<BookshelfShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const BookShelfItemShimmer();
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
