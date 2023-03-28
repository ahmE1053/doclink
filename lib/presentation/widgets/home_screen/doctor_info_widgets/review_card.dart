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
      title: const Text('Anonymous'),
      subtitle: Text(
        review.review,
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$rating',
            style: AppTypography.smallSize(
              context,
              colorScheme.outline,
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
