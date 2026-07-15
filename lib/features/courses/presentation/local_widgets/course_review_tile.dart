import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/rating_stars.dart';
import '../../domain/entities/course_review_entity.dart';

class CourseReviewTile extends StatelessWidget {
  final CourseReviewEntity review;

  const CourseReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: review.avatar,
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(review.reviewerName, style: AppTypography.bodyLargeMedium),
                Row(
                  children: [
                    RatingStars(rating: review.rating, size: 12, gap: 2),
                    const SizedBox(width: 12),
                    Text(
                      review.date,
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          review.comment,
          style: AppTypography.bodySmallRegular.copyWith(
            color: AppColors.neutral600,
          ),
        ),
      ],
    );
  }
}
