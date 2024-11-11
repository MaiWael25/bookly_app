import 'package:bookly_app/core/utils/assests.dart';
import 'package:flutter/material.dart';

class FeaturedItemListViewItem extends StatelessWidget {
  const FeaturedItemListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
                image: AssetImage(AssestsData.testImage), fit: BoxFit.fill)),
      ),
    );
  }
}
