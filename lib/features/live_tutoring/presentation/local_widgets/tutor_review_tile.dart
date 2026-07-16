import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/network_avatar.dart';
import '../../../../core/shared_widgets/rating_stars.dart';
import '../../domain/entities/tutor_detail_entity.dart';

class TutorReviewTile extends StatelessWidget {
  final TutorReviewEntity review;

  const TutorReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NetworkAvatar(imageUrl: review.avatar, size: 44),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  review.reviewerName,
                  style: AppTypography.bodyLargeMedium,
                ),
                Row(
                  children: [
                    RatingStars(rating: review.rating),
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
