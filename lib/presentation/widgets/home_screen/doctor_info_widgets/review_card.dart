import 'package:doclink/core/consts/app_typography.dart';
import 'package:doclink/domain/entities/doctor.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key, required this.review, required this.rating})
      : super(key: key);
  final Review review;
  final double rating;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      titleTextStyle: AppTypography.semiBodySize(context),
      subtitleTextStyle: AppTypography.smallSize(context),
      title: const Text('Anonymous'),
      subtitle: Text(
        review.review,
      ),
      contentPadding: EdgeInsets.zero,
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FittedBox(
              child: Text(
                '$rating',
                style: AppTypography.smallSize(
                  context,
                  colorScheme.outline,
                ),
              ),
            ),
          ),
          Expanded(
            child: FittedBox(
              child: const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
