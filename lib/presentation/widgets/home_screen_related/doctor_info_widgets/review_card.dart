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
      title: Text(
        'Anonymous',
        style: AppTypography.semiBodySize(context),
      ),
      subtitle: Text(
        review.review,
        style: AppTypography.smallSize(context),
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
          const Expanded(
            child: FittedBox(
              child: Icon(
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
